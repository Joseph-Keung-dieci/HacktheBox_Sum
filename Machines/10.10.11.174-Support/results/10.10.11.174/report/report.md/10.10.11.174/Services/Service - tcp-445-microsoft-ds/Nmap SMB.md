```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 445 --script="banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp445/tcp_445_smb_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp445/xml/tcp_445_smb_nmap.xml" 10.10.11.174
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp445/tcp_445_smb_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp445/tcp_445_smb_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Nov 23 09:21:22 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 445 "--script=banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp445/tcp_445_smb_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp445/xml/tcp_445_smb_nmap.xml 10.10.11.174
Nmap scan report for 10.10.11.174
Host is up, received user-set (0.032s latency).
Scanned at 2022-11-23 09:21:23 AEDT for 50s

PORT    STATE SERVICE       REASON  VERSION
445/tcp open  microsoft-ds? syn-ack
|_smb-enum-services: ERROR: Script execution failed (use -d to debug)

Host script results:
| smb-protocols: 
|   dialects: 
|     202
|     210
|     300
|     302
|_    311
| smb2-capabilities: 
|   202: 
|     Distributed File System
|   210: 
|     Distributed File System
|     Leasing
|     Multi-credit operations
|   300: 
|     Distributed File System
|     Leasing
|     Multi-credit operations
|   302: 
|     Distributed File System
|     Leasing
|     Multi-credit operations
|   311: 
|     Distributed File System
|     Leasing
|_    Multi-credit operations
|_smb-print-text: false
| smb2-time: 
|   date: 2022-11-22T22:21:38
|_  start_date: N/A
| smb-mbenum: 
|_  ERROR: Failed to connect to browser service: Could not negotiate a connection:SMB: Failed to receive bytes: ERROR
|_smb-vuln-ms10-061: Could not negotiate a connection:SMB: Failed to receive bytes: ERROR
| smb2-security-mode: 
|   311: 
|_    Message signing enabled and required

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Nov 23 09:22:13 2022 -- 1 IP address (1 host up) scanned in 51.02 seconds

```
