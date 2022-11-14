```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/xml/_quick_tcp_nmap.xml" 10.10.10.187
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_quick_tcp_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_quick_tcp_nmap.txt):

```
# Nmap 7.93 scan initiated Sun Nov 13 14:13:50 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN /home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_quick_tcp_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/xml/_quick_tcp_nmap.xml 10.10.10.187
Nmap scan report for 10.10.10.187
Host is up, received user-set (0.031s latency).
Scanned at 2022-11-13 14:13:50 AEDT for 9s
Not shown: 997 closed tcp ports (conn-refused)
PORT   STATE SERVICE REASON  VERSION
21/tcp open  ftp     syn-ack vsftpd 3.0.3
22/tcp open  ssh     syn-ack OpenSSH 7.4p1 Debian 10+deb9u7 (protocol 2.0)
| ssh-hostkey: 
|   2048 4a71e92163699dcbdd84021a2397e1b9 (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaQHjxkc8zeXPgI5C7066uFJaB6EjvTGDEwbfl0cwM95npP9G8icv1F/YQgKxqqcGzl+pVaAybRnQxiZkrZHbnJlMzUzNTxxI5cy+7W0dRZN4VH4YjkXFrZRw6dx/5L1wP4qLtdQ0tLHmgzwJZO+111mrAGXMt0G+SCnQ30U7vp95EtIC0gbiGDx0dDVgMeg43+LkzWG+Nj+mQ5KCQBjDLFaZXwCp5Pqfrpf3AmERjoFHIE8Df4QO3lKT9Ov1HWcnfFuqSH/pl5+m83ecQGS1uxAaokNfn9Nkg12dZP1JSk+Tt28VrpOZDKhVvAQhXWONMTyuRJmVg/hnrSfxTwbM9
|   256 c595b6214d46a425557a873e19a8e702 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNHgxoAB6NHTQnBo+/MqdfMsEet9jVzP94okTOAWWMpWkWkT+X4EEWRzlxZKwb/dnt99LS8WNZkR0P9HQxMcIII=
|   256 d02dddd05c42f87b315abe57c4a9a756 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBqp21lADoWZ+184z0m9zCpORbmmngq+h498H9JVf7kP
80/tcp open  http    syn-ack Apache httpd 2.4.25 ((Debian))
|_http-server-header: Apache/2.4.25 (Debian)
| http-methods: 
|_  Supported Methods: GET HEAD OPTIONS
| http-robots.txt: 1 disallowed entry 
|_/admin-dir
|_http-title: Admirer
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sun Nov 13 14:13:59 2022 -- 1 IP address (1 host up) scanned in 9.23 seconds

```
