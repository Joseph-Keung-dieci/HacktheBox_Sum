```
[*] Service scan wkhtmltoimage (tcp/80/http/wkhtmltoimage) ran a command which returned a non-zero exit code (1).
[-] Command: wkhtmltoimage --format png http://10.10.10.48:80/ /home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp80/tcp_80_http_screenshot.png
[-] Error Output:
Loading page (1/2)
[>                                                           ] 0%
Error: Failed to load http://10.10.10.48/, with network status code 203 and http status code 404 - Error transferring http://10.10.10.48/ - server replied: Not Found
[============================================================] 100%
Error: Failed loading page http://10.10.10.48:80/ (sometimes it will work just to ignore this error with --load-error-handling ignore)
Exit with code 1 due to network error: ContentNotFoundError


[*] Service scan Directory Buster (tcp/32400/http/dirbuster) ran a command which returned a non-zero exit code (1).
[-] Command: gobuster dir -u http://10.10.10.48:32400/ -t 50 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -k -x "txt,html,php,asp,aspx,jsp" -z -o "/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_gobuster_directory-list-2.3-medium.txt"
[-] Error Output:
Error: the server returns a status code that matches the provided options for non existing urls. http://10.10.10.48:32400/83d3d413-8af3-45c8-9e66-b7ac74ef9d4c => 401 (Length: 91). To continue please exclude the status code, the length or use the --wildcard switch


[*] Service scan wkhtmltoimage (tcp/32400/http/wkhtmltoimage) ran a command which returned a non-zero exit code (1).
[-] Command: wkhtmltoimage --format png http://10.10.10.48:32400/ /home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_screenshot.png
[-] Error Output:
Loading page (1/2)
[>                                                           ] 0%
Error: Failed to load http://10.10.10.48:32400/, with network status code 204 and http status code 401 - Host requires authentication
[==================>                                         ] 30%
[============================================================] 100%
[============================>                               ] 48% 
Warning: A finished ResourceObject received a loading progress signal. This might be an indication of an iframe taking too long to load.
Warning: A finished ResourceObject received a loading finished signal. This might be an indication of an iframe taking too long to load.
Rendering (2/2)
[>                                                           ] 0%
[===============>                                            ] 25%
[============================================================] 100%
Done
Exit with code 1 due to network error: AuthenticationRequiredError


[*] Service scan DNS Zone Transfer (tcp/53/domain/dns-zone-transfer) ran a command which returned a non-zero exit code (9).
[-] Command: dig AXFR -p 53 @10.10.10.48
[-] Error Output:



```