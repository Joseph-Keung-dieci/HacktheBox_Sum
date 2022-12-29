```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 88 --script="banner,krb5-enum-users" -oN "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp88/tcp_88_kerberos_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp88/xml/tcp_88_kerberos_nmap.xml" 10.10.11.174
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp88/tcp_88_kerberos_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp88/tcp_88_kerberos_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Nov 23 09:21:22 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 88 --script=banner,krb5-enum-users -oN /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp88/tcp_88_kerberos_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp88/xml/tcp_88_kerberos_nmap.xml 10.10.11.174
Nmap scan report for 10.10.11.174
Host is up, received user-set (0.023s latency).
Scanned at 2022-11-23 09:21:23 AEDT for 16s

PORT   STATE SERVICE      REASON  VERSION
88/tcp open  kerberos-sec syn-ack Microsoft Windows Kerberos (server time: 2022-11-22 22:21:29Z)
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Nov 23 09:21:39 2022 -- 1 IP address (1 host up) scanned in 17.54 seconds

```