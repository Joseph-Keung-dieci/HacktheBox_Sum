```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 25 --script="banner,(smtp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/tcp_25_smtp_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/xml/tcp_25_smtp_nmap.xml" 10.10.11.166
```

[/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/tcp_25_smtp_nmap.txt](file:///home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/tcp_25_smtp_nmap.txt):

```
# Nmap 7.92 scan initiated Sat Aug 13 07:23:26 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 25 "--script=banner,(smtp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/tcp_25_smtp_nmap.txt -oX /home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/xml/tcp_25_smtp_nmap.xml 10.10.11.166
Nmap scan report for 10.10.11.166
Host is up, received user-set (0.14s latency).
Scanned at 2022-08-13 07:23:30 EDT for 168s

PORT   STATE SERVICE REASON  VERSION
25/tcp open  smtp    syn-ack Postfix smtpd
|_smtp-commands: debian.localdomain, PIPELINING, SIZE 10240000, VRFY, ETRN, STARTTLS, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8, CHUNKING
| smtp-vuln-cve2010-4344: 
|_  The SMTP server is not Exim: NOT VULNERABLE
Service Info: Host:  debian.localdomain

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sat Aug 13 07:26:18 2022 -- 1 IP address (1 host up) scanned in 172.81 seconds

```
