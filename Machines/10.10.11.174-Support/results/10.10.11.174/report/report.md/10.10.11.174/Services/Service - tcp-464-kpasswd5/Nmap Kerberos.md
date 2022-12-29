```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 464 --script="banner,krb5-enum-users" -oN "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp464/tcp_464_kerberos_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp464/xml/tcp_464_kerberos_nmap.xml" 10.10.11.174
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp464/tcp_464_kerberos_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp464/tcp_464_kerberos_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Nov 23 09:21:22 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 464 --script=banner,krb5-enum-users -oN /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp464/tcp_464_kerberos_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp464/xml/tcp_464_kerberos_nmap.xml 10.10.11.174
Nmap scan report for 10.10.11.174
Host is up, received user-set (0.035s latency).
Scanned at 2022-11-23 09:21:23 AEDT for 18s

PORT    STATE SERVICE   REASON  VERSION
464/tcp open  kpasswd5? syn-ack

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Nov 23 09:21:41 2022 -- 1 IP address (1 host up) scanned in 18.84 seconds

```