```bash
whatweb --color=never --no-errors -a 3 -v http://10.10.10.187:80 2>&1
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_whatweb.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Admirer/results/10.10.10.187/scans/tcp80/tcp_80_http_whatweb.txt):

```
WhatWeb report for http://10.10.10.187:80
Status    : 200 OK
Title     : Admirer
IP        : 10.10.10.187
Country   : RESERVED, ZZ

Summary   : Apache[2.4.25], HTML5, HTTPServer[Debian Linux][Apache/2.4.25 (Debian)], JQuery, Script

Detected Plugins:
[ Apache ]
	The Apache HTTP Server Project is an effort to develop and
	maintain an open-source HTTP server for modern operating
	systems including UNIX and Windows NT. The goal of this
	project is to provide a secure, efficient and extensible
	server that provides HTTP services in sync with the current
	HTTP standards.

	Version      : 2.4.25 (from HTTP Server Header)
	Google Dorks: (3)
	Website     : http://httpd.apache.org/

[ HTML5 ]
	HTML version 5, detected by the doctype declaration


[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Debian Linux
	String       : Apache/2.4.25 (Debian) (from server string)

[ JQuery ]
	A fast, concise, JavaScript that simplifies how to traverse
	HTML documents, handle events, perform animations, and add
	AJAX.

	Website     : http://jquery.com/

[ Script ]
	This plugin detects instances of script HTML elements and
	returns the script language/type.


HTTP Headers:
	HTTP/1.1 200 OK
	Date: Sun, 13 Nov 2022 03:14:06 GMT
	Server: Apache/2.4.25 (Debian)
	Vary: Accept-Encoding
	Content-Encoding: gzip
	Content-Length: 1914
	Connection: close
	Content-Type: text/html; charset=UTF-8



```