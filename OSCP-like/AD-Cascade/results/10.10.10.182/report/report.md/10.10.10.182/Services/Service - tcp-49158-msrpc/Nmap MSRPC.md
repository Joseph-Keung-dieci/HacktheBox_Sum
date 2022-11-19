```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49158 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/tcp_49158_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/xml/tcp_49158_rpc_nmap.xml" 10.10.10.182
```

[/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/tcp_49158_rpc_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/tcp_49158_rpc_nmap.txt):

```
# Nmap 7.93 scan initiated Fri Nov 18 15:56:55 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49158 --script=banner,msrpc-enum,rpc-grind,rpcinfo -oN /home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/tcp_49158_rpc_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/xml/tcp_49158_rpc_nmap.xml 10.10.10.182
Nmap scan report for 10.10.10.182
Host is up, received user-set (0.033s latency).
Scanned at 2022-11-18 15:57:03 AEDT for 69s

PORT      STATE SERVICE REASON  VERSION
49158/tcp open  msrpc   syn-ack Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Nov 18 15:58:12 2022 -- 1 IP address (1 host up) scanned in 76.65 seconds

```
