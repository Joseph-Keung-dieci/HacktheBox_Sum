```bash
gobuster dir -u http://10.10.10.48:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt):

```
http://10.10.10.48:80/admin                (Status: 301) [Size: 0] [--> http://10.10.10.48:80/admin/]
http://10.10.10.48:80/versions             (Status: 200) [Size: 18]

```
