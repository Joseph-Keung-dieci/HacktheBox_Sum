```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/xml/_quick_tcp_nmap.xml" 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/_full_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/xml/_full_tcp_nmap.xml" 10.10.10.182

dig -p 53 -x 10.10.10.182 @10.10.10.182

dig AXFR -p 53 @10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 53 --script="banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/xml/tcp_53_dns_nmap.xml" 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 88 --script="banner,krb5-enum-users" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp88/tcp_88_kerberos_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp88/xml/tcp_88_kerberos_nmap.xml" 10.10.10.182

impacket-getArch -target 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 135 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp135/tcp_135_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp135/xml/tcp_135_rpc_nmap.xml" 10.10.10.182

impacket-rpcdump -port 135 10.10.10.182

enum4linux -a -M -l -d 10.10.10.182 2>&1

nbtscan -rvh 10.10.10.182 2>&1

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 139 --script="banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/tcp_139_smb_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp139/xml/tcp_139_smb_nmap.xml" 10.10.10.182

smbclient -L //10.10.10.182 -N -I 10.10.10.182 2>&1

smbmap -H 10.10.10.182 -P 139 2>&1

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 389 --script="banner,(ldap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp389/tcp_389_ldap_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp389/xml/tcp_389_ldap_nmap.xml" 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 445 --script="banner,(nbstat or smb* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp445/tcp_445_smb_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp445/xml/tcp_445_smb_nmap.xml" 10.10.10.182

smbmap -H 10.10.10.182 -P 445 2>&1

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 3268 --script="banner,(ldap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp3268/tcp_3268_ldap_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp3268/xml/tcp_3268_ldap_nmap.xml" 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49154 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49154/tcp_49154_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49154/xml/tcp_49154_rpc_nmap.xml" 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49155 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49155/tcp_49155_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49155/xml/tcp_49155_rpc_nmap.xml" 10.10.10.182

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49158 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/tcp_49158_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49158/xml/tcp_49158_rpc_nmap.xml" 10.10.10.182

smbmap -u null -p "" -H 10.10.10.182 -P 445 2>&1

smbmap -H 10.10.10.182 -P 445 -R 2>&1

smbmap -u null -p "" -H 10.10.10.182 -P 445 -R 2>&1

smbmap -H 10.10.10.182 -P 445 -x "ipconfig /all" 2>&1

smbmap -u null -p "" -H 10.10.10.182 -P 445 -x "ipconfig /all" 2>&1

smbmap -u null -p "" -H 10.10.10.182 -P 139 2>&1

smbmap -H 10.10.10.182 -P 139 -R 2>&1

smbmap -u null -p "" -H 10.10.10.182 -P 139 -R 2>&1

smbmap -H 10.10.10.182 -P 139 -x "ipconfig /all" 2>&1

smbmap -u null -p "" -H 10.10.10.182 -P 139 -x "ipconfig /all" 2>&1

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 49170 --script="banner,msrpc-enum,rpc-grind,rpcinfo" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49170/tcp_49170_rpc_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp49170/xml/tcp_49170_rpc_nmap.xml" 10.10.10.182


```