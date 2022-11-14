```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 88 --script="banner,krb5-enum-users" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp88/tcp_88_kerberos_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp88/xml/tcp_88_kerberos_nmap.xml" 10.10.10.172
```

[/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp88/tcp_88_kerberos_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp88/tcp_88_kerberos_nmap.txt):

```
# Nmap 7.93 scan initiated Mon Nov 14 11:26:13 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 88 --script=banner,krb5-enum-users -oN /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp88/tcp_88_kerberos_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp88/xml/tcp_88_kerberos_nmap.xml 10.10.10.172
Nmap scan report for 10.10.10.172
Host is up, received user-set (0.032s latency).
Scanned at 2022-11-14 11:26:13 AEDT for 17s

PORT   STATE SERVICE      REASON  VERSION
88/tcp open  kerberos-sec syn-ack Microsoft Windows Kerberos (server time: 2022-11-14 00:26:20Z)
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Mon Nov 14 11:26:30 2022 -- 1 IP address (1 host up) scanned in 17.36 seconds

```
