```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49684 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp49684/tcp_49684_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp49684/xml/tcp_49684_rpc_nmap.xml" 10.10.11.174
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp49684/tcp_49684_rpc_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp49684/tcp_49684_rpc_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Nov 23 09:23:01 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49684 --script=banner,msrpc-enum,rpc-grind,rpcinfo -oN /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp49684/tcp_49684_rpc_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp49684/xml/tcp_49684_rpc_nmap.xml 10.10.11.174
Nmap scan report for 10.10.11.174
Host is up, received user-set (0.026s latency).
Scanned at 2022-11-23 09:23:08 AEDT for 69s

PORT      STATE SERVICE REASON  VERSION
49684/tcp open  msrpc   syn-ack Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Nov 23 09:24:17 2022 -- 1 IP address (1 host up) scanned in 75.94 seconds

```