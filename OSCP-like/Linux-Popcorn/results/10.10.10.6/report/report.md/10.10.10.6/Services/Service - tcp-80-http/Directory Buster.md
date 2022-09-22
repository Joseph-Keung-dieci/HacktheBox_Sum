```bash
gobuster dir -u http://10.10.10.6:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt):

```
http://10.10.10.6:80/index                (Status: 200) [Size: 177]
http://10.10.10.6:80/index.html           (Status: 200) [Size: 177]
http://10.10.10.6:80/test                 (Status: 200) [Size: 47043]
http://10.10.10.6:80/test.php             (Status: 200) [Size: 47055]
http://10.10.10.6:80/torrent              (Status: 301) [Size: 310] [--> http://10.10.10.6/torrent/]
http://10.10.10.6:80/rename               (Status: 301) [Size: 309] [--> http://10.10.10.6/rename/]

```
