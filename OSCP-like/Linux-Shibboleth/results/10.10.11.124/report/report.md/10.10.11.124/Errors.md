```
[*] Service scan Directory Buster (tcp/80/http/dirbuster) ran a command which returned a non-zero exit code (1).
[-] Command: gobuster dir -u http://10.10.11.124:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
[-] Error Output:
Error: the server returns a status code that matches the provided options for non existing urls. http://10.10.11.124:80/2a5dbaa6-06b7-4e43-80bc-c650bfdf4dac => 302 (Length: 284). To continue please exclude the status code or the length


[*] Service scan Directory Buster (tcp/80/http/dirbuster) ran a command which returned a non-zero exit code (1).
[-] Command: gobuster dir -u http://10.10.11.124:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
[-] Error Output:
Error: the server returns a status code that matches the provided options for non existing urls. http://10.10.11.124:80/bd0fa7f3-7028-4c91-a147-aa39a3f7addd => 302 (Length: 284). To continue please exclude the status code or the length



```