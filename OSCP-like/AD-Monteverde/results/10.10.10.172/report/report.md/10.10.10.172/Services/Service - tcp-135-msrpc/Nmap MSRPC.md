```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 135 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp135/tcp_135_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp135/xml/tcp_135_rpc_nmap.xml" 10.10.10.172
```

[/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp135/tcp_135_rpc_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp135/tcp_135_rpc_nmap.txt):

```
# Nmap 7.93 scan initiated Mon Nov 14 11:26:13 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 135 --script=banner,msrpc-enum,rpc-grind,rpcinfo -oN /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp135/tcp_135_rpc_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp135/xml/tcp_135_rpc_nmap.xml 10.10.10.172
Nmap scan report for 10.10.10.172
Host is up, received user-set (0.028s latency).
Scanned at 2022-11-14 11:26:14 AEDT for 21s

PORT    STATE SERVICE REASON  VERSION
135/tcp open  msrpc   syn-ack Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Mon Nov 14 11:26:35 2022 -- 1 IP address (1 host up) scanned in 22.80 seconds

```
