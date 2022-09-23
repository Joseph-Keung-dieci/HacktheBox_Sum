```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/xml/_quick_tcp_nmap.xml" 10.10.10.227

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/_full_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/xml/_full_tcp_nmap.xml" 10.10.10.227

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 22 --script="banner,ssh2-enum-algos,ssh-hostkey,ssh-auth-methods" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp22/tcp_22_ssh_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp22/xml/tcp_22_ssh_nmap.xml" 10.10.10.227

gobuster dir -u http://10.10.10.227:8080/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_gobuster_directory-list-2.3-medium.txt"

curl -sSikf http://10.10.10.227:8080/.well-known/security.txt

curl -sSikf http://10.10.10.227:8080/robots.txt

curl -sSik http://10.10.10.227:8080/

nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 8080 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/xml/tcp_8080_http_nmap.xml" 10.10.10.227

whatweb --color=never --no-errors -a 3 -v http://10.10.10.227:8080 2>&1

wkhtmltoimage --format png http://10.10.10.227:8080/ /home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_screenshot.png


```