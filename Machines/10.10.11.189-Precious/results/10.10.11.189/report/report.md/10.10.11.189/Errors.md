```
[*] Service scan Directory Buster (tcp/80/http/dirbuster) ran a command which returned a non-zero exit code (1).
[-] Command: gobuster dir -u http://10.10.11.189:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
[-] Error Output:
Error: the server returns a status code that matches the provided options for non existing urls. http://10.10.11.189:80/dd32fe85-3098-460f-97f8-79b6966596d3 => 302 (Length: 145). To continue please exclude the status code or the length



```