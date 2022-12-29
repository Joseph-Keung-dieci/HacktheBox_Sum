```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/xml/_quick_tcp_nmap.xml" 10.10.11.189
```

[/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/_quick_tcp_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/_quick_tcp_nmap.txt):

```
# Nmap 7.93 scan initiated Fri Dec  2 16:41:57 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN /home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/_quick_tcp_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/xml/_quick_tcp_nmap.xml 10.10.11.189
Nmap scan report for 10.10.11.189
Host is up, received user-set.
Scanned at 2022-12-02 16:42:07 AEDT for 4s
All 1000 scanned ports on 10.10.11.189 are in ignored states.
Not shown: 1000 filtered tcp ports (no-response)

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Dec  2 16:42:11 2022 -- 1 IP address (1 host up) scanned in 13.52 seconds

```
