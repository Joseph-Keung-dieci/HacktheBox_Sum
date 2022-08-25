```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/_quick_tcp_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/xml/_quick_tcp_nmap.xml" 10.10.11.166

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/_full_tcp_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/xml/_full_tcp_nmap.xml" 10.10.11.166

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 22 --script="banner,ssh2-enum-algos,ssh-hostkey,ssh-auth-methods" -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp22/tcp_22_ssh_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp22/xml/tcp_22_ssh_nmap.xml" 10.10.11.166

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 25 --script="banner,(smtp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/tcp_25_smtp_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp25/xml/tcp_25_smtp_nmap.xml" 10.10.11.166

hydra smtp-enum://10.10.11.166:25/vrfy -L "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" 2>&1

dig -p 53 -x 10.10.11.166 @10.10.11.166

dig AXFR -p 53 @10.10.11.166

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 53 --script="banner,(dns* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp53/tcp_53_dns_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp53/xml/tcp_53_dns_nmap.xml" 10.10.11.166

gobuster dir -u http://10.10.11.166:80/ -t 250 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"

curl -sSikf http://10.10.11.166:80/.well-known/security.txt

curl -sSikf http://10.10.11.166:80/robots.txt

curl -sSik http://10.10.11.166:80/

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_nmap.txt" -oX "/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/xml/tcp_80_http_nmap.xml" 10.10.11.166

whatweb --color=never --no-errors -a 3 -v http://10.10.11.166:80 2>&1

wkhtmltoimage --format png http://10.10.11.166:80/ /home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_screenshot.png

hydra smtp-enum://10.10.11.166:25/expn -L "/usr/share/seclists/Usernames/top-usernames-shortlist.txt" 2>&1


```