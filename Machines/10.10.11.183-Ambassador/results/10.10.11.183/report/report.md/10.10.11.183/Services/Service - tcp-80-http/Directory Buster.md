```bash
gobuster dir -u http://10.10.11.183:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
```

[/home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt):

```
http://10.10.11.183:80/images               (Status: 301) [Size: 313] [--> http://10.10.11.183/images/]
http://10.10.11.183:80/index.html           (Status: 200) [Size: 3654]
http://10.10.11.183:80/.html                (Status: 403) [Size: 277]
http://10.10.11.183:80/categories           (Status: 301) [Size: 317] [--> http://10.10.11.183/categories/]
http://10.10.11.183:80/posts                (Status: 301) [Size: 312] [--> http://10.10.11.183/posts/]
http://10.10.11.183:80/tags                 (Status: 301) [Size: 311] [--> http://10.10.11.183/tags/]
http://10.10.11.183:80/404.html             (Status: 200) [Size: 1793]
http://10.10.11.183:80/.html                (Status: 403) [Size: 277]
http://10.10.11.183:80/server-status        (Status: 403) [Size: 277]

```
