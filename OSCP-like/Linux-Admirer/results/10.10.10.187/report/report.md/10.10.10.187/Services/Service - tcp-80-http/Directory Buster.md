```bash
gobuster dir -u http://10.10.10.187:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt):

```
http://10.10.10.187:80/.php                 (Status: 403) [Size: 277]
http://10.10.10.187:80/index.php            (Status: 200) [Size: 6051]
http://10.10.10.187:80/.html                (Status: 403) [Size: 277]
http://10.10.10.187:80/images               (Status: 301) [Size: 313] [--> http://10.10.10.187/images/]
http://10.10.10.187:80/assets               (Status: 301) [Size: 313] [--> http://10.10.10.187/assets/]
http://10.10.10.187:80/robots.txt           (Status: 200) [Size: 138]
http://10.10.10.187:80/.php                 (Status: 403) [Size: 277]
http://10.10.10.187:80/.html                (Status: 403) [Size: 277]
http://10.10.10.187:80/server-status        (Status: 403) [Size: 277]

```
