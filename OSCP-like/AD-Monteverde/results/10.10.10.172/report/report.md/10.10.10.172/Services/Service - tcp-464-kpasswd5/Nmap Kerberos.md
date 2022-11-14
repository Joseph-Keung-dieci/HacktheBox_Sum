```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 464 --script="banner,krb5-enum-users" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp464/tcp_464_kerberos_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp464/xml/tcp_464_kerberos_nmap.xml" 10.10.10.172
```

[/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp464/tcp_464_kerberos_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp464/tcp_464_kerberos_nmap.txt):

```
# Nmap 7.93 scan initiated Mon Nov 14 11:26:13 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 464 --script=banner,krb5-enum-users -oN /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp464/tcp_464_kerberos_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp464/xml/tcp_464_kerberos_nmap.xml 10.10.10.172
Nmap scan report for 10.10.10.172
Host is up, received user-set (0.025s latency).
Scanned at 2022-11-14 11:26:14 AEDT for 18s

PORT    STATE SERVICE   REASON  VERSION
464/tcp open  kpasswd5? syn-ack

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Mon Nov 14 11:26:32 2022 -- 1 IP address (1 host up) scanned in 19.00 seconds

```
