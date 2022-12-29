```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN "/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/_quick_tcp_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/xml/_quick_tcp_nmap.xml" 10.10.11.186
```

[/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/_quick_tcp_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/_quick_tcp_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Dec  7 15:54:40 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -oN /home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/_quick_tcp_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/xml/_quick_tcp_nmap.xml 10.10.11.186
Nmap scan report for metapress.htb (10.10.11.186)
Host is up, received user-set (0.030s latency).
Scanned at 2022-12-07 15:54:40 AEDT for 561s
Not shown: 997 closed tcp ports (conn-refused)
PORT   STATE SERVICE REASON  VERSION
21/tcp open  ftp     syn-ack
| fingerprint-strings: 
|   GenericLines: 
|     220 ProFTPD Server (Debian) [::ffff:10.10.11.186]
|     Invalid command: try being more creative
|     Invalid command: try being more creative
|   Verifier: 
|_    220 ProFTPD Server (Debian) [::ffff:10.10.11.186]
22/tcp open  ssh     syn-ack OpenSSH 8.4p1 Debian 5+deb11u1 (protocol 2.0)
| ssh-hostkey: 
|   3072 c4b44617d2102d8fec1dc927fecd79ee (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPp9LmBKMOuXu2ZOpw8JorL5ah0sU0kIBXvJB8LX26rpbOhw+1MPdhx6ptZzXwQ8wkQc88xu5h+oB8NGkeHLYhvRqtZmvkTpOsyJiMm+0Udbg+IJCENPiKGSC5J+0tt4QPj92xtTe/f7WV4hbBLDQust46D1xVJVOCNfaloIC40BtWoMWIoEFWnk7U3kwXcM5336LuUnhm69XApDB4y/dt5CgXFoWlDQi45WLLQGbanCNAlT9XwyPnpIyqQdF7mRJ5yRXUOXGeGmoO9+JALVQIEJ/7Ljxts6QuV633wFefpxnmvTu7XX9W8vxUcmInIEIQCmunR5YH4ZgWRclT+6rzwRQw1DH1z/ZYui5Bjn82neoJunhweTJXQcotBp8glpvq3X/rQgZASSyYrOJghBlNVZDqPzp4vBC78gn6TyZyuJXhDxw+lHxF82IMT2fatp240InLVvoWrTWlXlEyPiHraKC0okOVtul6T0VRxsuT+QsyU7pdNFkn2wDVvC25AW8=
|   256 2aea2fcb23e8c529409cab866dcd4411 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBB1ZmNogWBUF8MwkNsezebQ+0/yPq7RX3/j9s4Qh8jbGlmvAcN0Z/aIBrzbEuTRf3/cHehtaNf9qrF2ehQAeM94=
|   256 fd78c0b0e22016fa050debd83f12a4ab (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOP4kxBr9kumAjfplon8fXJpuqhdMJy2rpd3FM7+mGw2
80/tcp open  http    syn-ack nginx 1.18.0
|_http-generator: WordPress 5.6.2
|_http-title: MetaPress &#8211; Official company site
|_http-server-header: nginx/1.18.0
|_http-trane-info: Problem with XML parsing of /evox/about
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
| http-robots.txt: 1 disallowed entry 
|_/wp-admin/
| http-methods: 
|_  Supported Methods: GET HEAD POST
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port21-TCP:V=7.93%I=9%D=12/7%Time=63901C9C%P=aarch64-unknown-linux-gnu%
SF:r(GenericLines,8F,"220\x20ProFTPD\x20Server\x20\(Debian\)\x20\[::ffff:1
SF:0\.10\.11\.186\]\r\n500\x20Invalid\x20command:\x20try\x20being\x20more\
SF:x20creative\r\n500\x20Invalid\x20command:\x20try\x20being\x20more\x20cr
SF:eative\r\n")%r(Verifier,33,"220\x20ProFTPD\x20Server\x20\(Debian\)\x20\
SF:[::ffff:10\.10\.11\.186\]\r\n");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Dec  7 16:04:01 2022 -- 1 IP address (1 host up) scanned in 560.35 seconds

```
