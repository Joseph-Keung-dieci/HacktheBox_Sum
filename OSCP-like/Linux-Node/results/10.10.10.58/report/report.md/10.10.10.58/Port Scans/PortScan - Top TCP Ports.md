```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/xml/_quick_tcp_nmap.xml" 10.10.10.58
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/_quick_tcp_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/_quick_tcp_nmap.txt):

```
# Nmap 7.92 scan initiated Mon Oct  3 16:51:18 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN /home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/_quick_tcp_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/xml/_quick_tcp_nmap.xml 10.10.10.58
Nmap scan report for 10.10.10.58
Host is up, received user-set (0.027s latency).
Scanned at 2022-10-03 16:51:19 AEDT for 14s
Not shown: 998 filtered tcp ports (no-response)
PORT     STATE SERVICE         REASON  VERSION
22/tcp   open  ssh             syn-ack OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 dc:5e:34:a6:25:db:43:ec:eb:40:f4:96:7b:8e:d1:da (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwesV+Yg8+5O97ZnNFclkSnRTeyVnj6XokDNKjhB3+8R2I+r78qJmEgVr/SLJ44XjDzzlm0VGUqTmMP2KxANfISZWjv79Ljho3801fY4nbA43492r+6/VXeer0qhhTM4KhSPod5IxllSU6ZSqAV+O0ccf6FBxgEtiiWnE+ThrRiEjLYnZyyWUgi4pE/WPvaJDWtyfVQIrZohayy+pD7AzkLTrsvWzJVA8Vvf+Ysa0ElHfp3lRnw28WacWSaOyV0bsPdTgiiOwmoN8f9aKe5q7Pg4ZikkxNlqNG1EnuBThgMQbrx72kMHfRYvdwAqxOPbRjV96B2SWNWpxMEVL5tYGb
|   256 6c:8e:5e:5f:4f:d5:41:7d:18:95:d1:dc:2e:3f:e5:9c (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKQ4w0iqXrfz0H+KQEu5D6zKCfc6IOH2GRBKKkKOnP/0CrH2I4stmM1C2sGvPLSurZtohhC+l0OSjKaZTxPu4sU=
|   256 d8:78:b8:5d:85:ff:ad:7b:e6:e2:b5:da:1e:52:62:36 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB5cgCL/RuiM/AqWOqKOIL1uuLLjN9E5vDSBVDqIYU6y
3000/tcp open  hadoop-datanode syn-ack Apache Hadoop
|_http-favicon: Unknown favicon MD5: 30F2CC86275A96B522F9818576EC65CF
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
| hadoop-datanode-info: 
|_  Logs: /login
| hadoop-tasktracker-info: 
|_  Logs: /login
|_http-title: MyPlace
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Mon Oct  3 16:51:33 2022 -- 1 IP address (1 host up) scanned in 14.52 seconds

```