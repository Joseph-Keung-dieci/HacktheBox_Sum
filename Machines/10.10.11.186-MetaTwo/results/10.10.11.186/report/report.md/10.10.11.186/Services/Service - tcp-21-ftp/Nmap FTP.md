```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 21 --script="banner,(ftp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp21/tcp_21_ftp_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp21/xml/tcp_21_ftp_nmap.xml" 10.10.11.186
```

[/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp21/tcp_21_ftp_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp21/tcp_21_ftp_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Dec  7 16:04:01 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 21 "--script=banner,(ftp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp21/tcp_21_ftp_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp21/xml/tcp_21_ftp_nmap.xml 10.10.11.186
Nmap scan report for metapress.htb (10.10.11.186)
Host is up, received user-set (0.031s latency).
Scanned at 2022-12-07 16:04:01 AEDT for 337s

PORT   STATE SERVICE REASON  VERSION
21/tcp open  ftp?    syn-ack
| fingerprint-strings: 
|   GenericLines: 
|     220 ProFTPD Server (Debian) [::ffff:10.10.11.186]
|     Invalid command: try being more creative
|_    Invalid command: try being more creative
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port21-TCP:V=7.93%I=7%D=12/7%Time=63901ECC%P=aarch64-unknown-linux-gnu%
SF:r(GenericLines,8F,"220\x20ProFTPD\x20Server\x20\(Debian\)\x20\[::ffff:1
SF:0\.10\.11\.186\]\r\n500\x20Invalid\x20command:\x20try\x20being\x20more\
SF:x20creative\r\n500\x20Invalid\x20command:\x20try\x20being\x20more\x20cr
SF:eative\r\n");

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Dec  7 16:09:38 2022 -- 1 IP address (1 host up) scanned in 337.53 seconds

```