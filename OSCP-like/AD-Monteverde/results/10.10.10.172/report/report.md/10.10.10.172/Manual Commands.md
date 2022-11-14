```bash
[*] domain on tcp/53

	[-] Use dnsrecon to bruteforce subdomains of a DNS domain.

		dnsrecon -n 10.10.10.172 -d <DOMAIN-NAME> -D /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -t brt 2>&1 | tee /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp53/tcp_53_dnsrecon_subdomain_bruteforce.txt

	[-] Use dnsrecon to automatically query data from the DNS server. You must specify the target domain name.

		dnsrecon -n 10.10.10.172 -d <DOMAIN-NAME> 2>&1 | tee /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp53/tcp_53_dnsrecon_default_manual.txt

[*] msrpc on tcp/135

	[-] RPC Client:

		rpcclient -p 135 -U "" 10.10.10.172

[*] netbios-ssn on tcp/139

	[-] Nmap scans for SMB vulnerabilities that could potentially cause a DoS if scanned (according to Nmap). Be careful:

		nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 139 --script="smb-vuln-ms06-025" --script-args="unsafe=1" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp139/tcp_139_smb_ms06-025.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp139/xml/tcp_139_smb_ms06-025.xml" 10.10.10.172

		nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 139 --script="smb-vuln-ms07-029" --script-args="unsafe=1" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp139/tcp_139_smb_ms07-029.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp139/xml/tcp_139_smb_ms07-029.xml" 10.10.10.172

		nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 139 --script="smb-vuln-ms08-067" --script-args="unsafe=1" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp139/tcp_139_smb_ms08-067.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp139/xml/tcp_139_smb_ms08-067.xml" 10.10.10.172

[*] ldap on tcp/389

	[-] ldapsearch command (modify before running):

		ldapsearch -x -D "<username>" -w "<password>" -H ldap://10.10.10.172:389 -b "dc=example,dc=com" -s sub "(objectclass=*)" 2>&1 | tee > "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp389/tcp_389_ldap_all-entries.txt"

[*] microsoft-ds on tcp/445

	[-] Lookup SIDs

		lookupsid.py [username]:[password]@10.10.10.172

	[-] Nmap scans for SMB vulnerabilities that could potentially cause a DoS if scanned (according to Nmap). Be careful:

		nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 445 --script="smb-vuln-ms06-025" --script-args="unsafe=1" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp445/tcp_445_smb_ms06-025.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp445/xml/tcp_445_smb_ms06-025.xml" 10.10.10.172

		nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 445 --script="smb-vuln-ms07-029" --script-args="unsafe=1" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp445/tcp_445_smb_ms07-029.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp445/xml/tcp_445_smb_ms07-029.xml" 10.10.10.172

		nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 445 --script="smb-vuln-ms08-067" --script-args="unsafe=1" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp445/tcp_445_smb_ms08-067.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp445/xml/tcp_445_smb_ms08-067.xml" 10.10.10.172

[*] ldap on tcp/3268

	[-] ldapsearch command (modify before running):

		ldapsearch -x -D "<username>" -w "<password>" -H ldap://10.10.10.172:3268 -b "dc=example,dc=com" -s sub "(objectclass=*)" 2>&1 | tee > "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/tcp_3268_ldap_all-entries.txt"

[*] wsman on tcp/5985

	[-] Bruteforce logins:

		crackmapexec winrm 10.10.10.172 -d <domain> -u /usr/share/seclists/Usernames/top-usernames-shortlist.txt -p /usr/share/seclists/Passwords/darkweb2017-top100.txt

	[-] Check login (requires credentials):

		crackmapexec winrm 10.10.10.172 -d <domain> -u <username> -p <password> -x "whoami"

	[-] Evil WinRM (gem install evil-winrm):

		evil-winrm -u <user> -p <password> -i 10.10.10.172

		evil-winrm -u <user> -H <hash> -i 10.10.10.172

[*] msrpc on tcp/49667

	[-] RPC Client:

		rpcclient -p 49667 -U "" 10.10.10.172

[*] msrpc on tcp/49674

	[-] RPC Client:

		rpcclient -p 49674 -U "" 10.10.10.172

[*] msrpc on tcp/49676

	[-] RPC Client:

		rpcclient -p 49676 -U "" 10.10.10.172

[*] msrpc on tcp/49697

	[-] RPC Client:

		rpcclient -p 49697 -U "" 10.10.10.172


```