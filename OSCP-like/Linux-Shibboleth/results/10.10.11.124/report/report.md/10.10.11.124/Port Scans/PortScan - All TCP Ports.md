```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/_full_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/xml/_full_tcp_nmap.xml" 10.10.11.124
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/_full_tcp_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/_full_tcp_nmap.txt):

```
# Nmap 7.92 scan initiated Thu Nov  3 16:50:51 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN /home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/_full_tcp_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/xml/_full_tcp_nmap.xml 10.10.11.124
Nmap scan report for shibboleth.htb (10.10.11.124)
Host is up, received user-set (0.040s latency).
Scanned at 2022-11-03 16:50:51 AEDT for 21s
Not shown: 65534 closed tcp ports (conn-refused)
PORT   STATE SERVICE REASON  VERSION
80/tcp open  http    syn-ack Apache httpd 2.4.41
| http-methods: 
|_  Supported Methods: GET POST OPTIONS HEAD
|_http-title: FlexStart Bootstrap Template - Index
|_http-favicon: Unknown favicon MD5: FED84E16B6CCFE88EE7FFAAE5DFEFD34
|_http-server-header: Apache/2.4.41 (Ubuntu)

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Thu Nov  3 16:51:12 2022 -- 1 IP address (1 host up) scanned in 21.04 seconds

```
