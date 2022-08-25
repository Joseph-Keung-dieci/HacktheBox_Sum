```bash
gobuster dir -u http://10.10.11.166:80/ -t 250 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
```

[/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt](file:///home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt):

```
http://10.10.11.166:80/index.html           (Status: 200) [Size: 5480]
http://10.10.11.166:80/assets               (Status: 301) [Size: 185] [--> http://10.10.11.166/assets/]
http://10.10.11.166:80/css                  (Status: 301) [Size: 185] [--> http://10.10.11.166/css/]
http://10.10.11.166:80/js                   (Status: 301) [Size: 185] [--> http://10.10.11.166/js/]

```
