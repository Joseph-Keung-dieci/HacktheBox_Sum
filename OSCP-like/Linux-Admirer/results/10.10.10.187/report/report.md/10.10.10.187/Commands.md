```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/xml/_quick_tcp_nmap.xml" 10.10.10.187

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_full_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/xml/_full_tcp_nmap.xml" 10.10.10.187

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/xml/_quick_tcp_nmap.xml" 10.10.10.187

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/_full_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/xml/_full_tcp_nmap.xml" 10.10.10.187

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 21 --script="banner,(ftp* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp21/tcp_21_ftp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp21/xml/tcp_21_ftp_nmap.xml" 10.10.10.187

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 22 --script="banner,ssh2-enum-algos,ssh-hostkey,ssh-auth-methods" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp22/tcp_22_ssh_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp22/xml/tcp_22_ssh_nmap.xml" 10.10.10.187

gobuster dir -u http://10.10.10.187:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"

curl -sSikf http://10.10.10.187:80/.well-known/security.txt

curl -sSikf http://10.10.10.187:80/robots.txt

curl -sSik http://10.10.10.187:80/

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/xml/tcp_80_http_nmap.xml" 10.10.10.187

whatweb --color=never --no-errors -a 3 -v http://10.10.10.187:80 2>&1

wkhtmltoimage --format png http://10.10.10.187:80/ /home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_screenshot.png


```