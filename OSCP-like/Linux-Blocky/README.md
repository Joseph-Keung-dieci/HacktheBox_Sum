# Blocky

### Nmap

```
21/tcp    open  ftp       ProFTPD 1.3.5a
22/tcp    open  ssh       OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 d6:2b:99:b4:d5:e7:53:ce:2b:fc:b5:d7:9d:79:fb:a2 (RSA)
|   256 5d:7f:38:95:70:c9:be:ac:67:a0:1e:86:e7:97:84:03 (ECDSA)
|_  256 09:d5:c2:04:95:1a:90:ef:87:56:25:97:df:83:70:67 (ED25519)
80/tcp    open  http      Apache httpd 2.4.18
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-title: Did not follow redirect to http://blocky.htb
|_http-server-header: Apache/2.4.18 (Ubuntu)
25565/tcp open  minecraft Minecraft 1.11.2 (Protocol: 127, Message: A Minecraft Server, Users: 0/20)
Service Info: Host: 127.0.1.1; OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel
```

### Web Enum

```
http://blocky.htb/phpmyadmin/

users: notch
http://blocky.htb/index.php/wp-json/wp/v2/users/?per_page=100&page=1

wp version: 4.8

http://blocky.htb/plugins/
```

### Exploitation

```bash
# phpmyadmin and ssh cred (BlockyCore/com/myfirstplugin)
root:8YsqfCTnvxAUeduzjNSXe22
notch:8YsqfCTnvxAUeduzjNSXe22
```

### Priv Esc

```bash
User notch may run the following commands on Blocky:
    (ALL : ALL) ALL
```
