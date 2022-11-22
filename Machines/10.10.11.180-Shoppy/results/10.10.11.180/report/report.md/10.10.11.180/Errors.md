```
[*] Service scan Directory Buster (tcp/80/http/dirbuster) ran a command which returned a non-zero exit code (1).
[-] Command: gobuster dir -u http://10.10.11.180:80/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/Machines/10.10.11.180-Shoppy/results/10.10.11.180/scans/tcp80/tcp_80_http_gobuster_directory-list-2.3-medium.txt"
[-] Error Output:
Error: the server returns a status code that matches the provided options for non existing urls. http://10.10.11.180:80/b732c448-b914-4a94-ae4a-4bb204adb6e9 => 301 (Length: 169). To continue please exclude the status code or the length


[*] Service scan wkhtmltoimage (tcp/80/http/wkhtmltoimage) ran a command which returned a non-zero exit code (1).
[-] Command: wkhtmltoimage --format png http://10.10.11.180:80/ /home/parallels/HacktheBox/Machines/10.10.11.180-Shoppy/results/10.10.11.180/scans/tcp80/tcp_80_http_screenshot.png
[-] Error Output:
Loading page (1/2)
[>                                                           ] 0%
Error: Failed to load http://shoppy.htb/, with network status code 3 and http status code 0 - Host shoppy.htb not found
[============================================================] 100%
Error: Failed loading page http://10.10.11.180:80/ (sometimes it will work just to ignore this error with --load-error-handling ignore)
Exit with code 1 due to network error: HostNotFoundError



```