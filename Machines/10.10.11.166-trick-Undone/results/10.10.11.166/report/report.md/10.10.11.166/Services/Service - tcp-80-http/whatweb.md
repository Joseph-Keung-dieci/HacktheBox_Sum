```bash
whatweb --color=never --no-errors -a 3 -v http://10.10.11.166:80 2>&1
```

[/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_whatweb.txt](file:///home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp80/tcp_80_http_whatweb.txt):

```
WhatWeb report for http://10.10.11.166:80
Status    : 200 OK
Title     : Coming Soon - Start Bootstrap Theme
IP        : 10.10.11.166
Country   : RESERVED, ZZ

Summary   : Bootstrap, HTML5, HTTPServer[nginx/1.14.2], nginx[1.14.2], Script

Detected Plugins:
[ Bootstrap ]
	Bootstrap is an open source toolkit for developing with
	HTML, CSS, and JS.

	Website     : https://getbootstrap.com/

[ HTML5 ]
	HTML version 5, detected by the doctype declaration


[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	String       : nginx/1.14.2 (from server string)

[ Script ]
	This plugin detects instances of script HTML elements and
	returns the script language/type.


[ nginx ]
	Nginx (Engine-X) is a free, open-source, high-performance
	HTTP server and reverse proxy, as well as an IMAP/POP3
	proxy server.

	Version      : 1.14.2
	Website     : http://nginx.net/

HTTP Headers:
	HTTP/1.1 200 OK
	Server: nginx/1.14.2
	Date: Sat, 13 Aug 2022 11:23:32 GMT
	Content-Type: text/html
	Last-Modified: Wed, 23 Mar 2022 16:34:04 GMT
	Transfer-Encoding: chunked
	Connection: close
	ETag: W/"623b4bfc-1568"
	Content-Encoding: gzip



```