```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 139 --script="banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/tcp_139_smb_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/xml/tcp_139_smb_nmap.xml" 10.10.10.182
```

[/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/tcp_139_smb_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/tcp_139_smb_nmap.txt):

```
# Nmap 7.93 scan initiated Fri Nov 18 15:56:55 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 139 "--script=banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/tcp_139_smb_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/xml/tcp_139_smb_nmap.xml 10.10.10.182
Nmap scan report for 10.10.10.182
Host is up, received user-set (0.042s latency).
Scanned at 2022-11-18 15:57:02 AEDT for 40s

PORT    STATE SERVICE     REASON  VERSION
139/tcp open  netbios-ssn syn-ack Microsoft Windows netbios-ssn
|_smb-enum-services: ERROR: Script execution failed (use -d to debug)
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_smb2-time: ERROR: Script execution failed (use -d to debug)
|_smb-print-text: false
|_smb-protocols: No dialects accepted. Something may be blocking the responses
|_smb2-security-mode: SMB: Couldn't find a NetBIOS name that works for the server. Sorry!
|_smb2-capabilities: SMB: Couldn't find a NetBIOS name that works for the server. Sorry!
|_smb-mbenum: ERROR: Script execution failed (use -d to debug)
|_smb-vuln-ms10-061: SMB: Couldn't find a NetBIOS name that works for the server. Sorry!

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Nov 18 15:57:42 2022 -- 1 IP address (1 host up) scanned in 46.99 seconds

```
