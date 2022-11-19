```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 53 --script="banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/xml/tcp_53_dns_nmap.xml" 10.10.10.182
```

[/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_nmap.txt):

```
# Nmap 7.93 scan initiated Fri Nov 18 15:56:55 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 53 "--script=banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/xml/tcp_53_dns_nmap.xml 10.10.10.182
Nmap scan report for 10.10.10.182
Host is up, received user-set (0.022s latency).
Scanned at 2022-11-18 15:57:02 AEDT for 21s

PORT   STATE SERVICE REASON  VERSION
53/tcp open  domain  syn-ack Microsoft DNS 6.1.7601 (1DB15D39) (Windows Server 2008 R2 SP1)
|_dns-nsec3-enum: Can't determine domain for host 10.10.10.182; use dns-nsec3-enum.domains script arg.
| dns-nsid: 
|_  bind.version: Microsoft DNS 6.1.7601 (1DB15D39)
|_dns-nsec-enum: Can't determine domain for host 10.10.10.182; use dns-nsec-enum.domains script arg.
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows_server_2008:r2:sp1

Host script results:
|_dns-brute: Can't guess domain of "10.10.10.182"; use dns-brute.domain script argument.

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Nov 18 15:57:23 2022 -- 1 IP address (1 host up) scanned in 28.76 seconds

```
