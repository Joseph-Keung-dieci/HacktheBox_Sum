```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 53 --script="banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp53/tcp_53_dns_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp53/xml/tcp_53_dns_nmap.xml" 10.10.11.174
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp53/tcp_53_dns_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp53/tcp_53_dns_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Nov 23 09:21:22 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 53 "--script=banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp53/tcp_53_dns_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp53/xml/tcp_53_dns_nmap.xml 10.10.11.174
Nmap scan report for 10.10.11.174
Host is up, received user-set (0.037s latency).
Scanned at 2022-11-23 09:21:23 AEDT for 158s

PORT   STATE SERVICE REASON  VERSION
53/tcp open  domain? syn-ack
|_dns-nsec-enum: Can't determine domain for host 10.10.11.174; use dns-nsec-enum.domains script arg.
|_dns-nsec3-enum: Can't determine domain for host 10.10.11.174; use dns-nsec3-enum.domains script arg.

Host script results:
|_dns-brute: Can't guess domain of "10.10.11.174"; use dns-brute.domain script argument.

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Nov 23 09:24:01 2022 -- 1 IP address (1 host up) scanned in 159.56 seconds

```
