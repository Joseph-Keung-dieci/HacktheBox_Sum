```bash
whatweb --color=never --no-errors -a 3 -v http://10.10.10.6:80 2>&1
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_whatweb.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_whatweb.txt):

```
WhatWeb report for http://10.10.10.6:80
Status    : 200 OK
Title     : <None>
IP        : 10.10.10.6
Country   : RESERVED, ZZ

Summary   : Apache[2.2.12], HTTPServer[Ubuntu Linux][Apache/2.2.12 (Ubuntu)]

Detected Plugins:
[ Apache ]
	The Apache HTTP Server Project is an effort to develop and
	maintain an open-source HTTP server for modern operating
	systems including UNIX and Windows NT. The goal of this
	project is to provide a secure, efficient and extensible
	server that provides HTTP services in sync with the current
	HTTP standards.

	Version      : 2.2.12 (from HTTP Server Header)
	Google Dorks: (3)
	Website     : http://httpd.apache.org/

[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Ubuntu Linux
	String       : Apache/2.2.12 (Ubuntu) (from server string)

HTTP Headers:
	HTTP/1.1 200 OK
	Date: Wed, 21 Sep 2022 10:36:53 GMT
	Server: Apache/2.2.12 (Ubuntu)
	Last-Modified: Fri, 17 Mar 2017 17:07:05 GMT
	ETag: "aa65-b1-54af035029fd5"
	Accept-Ranges: bytes
	Vary: Accept-Encoding
	Content-Encoding: gzip
	Content-Length: 146
	Connection: close
	Content-Type: text/html



```
