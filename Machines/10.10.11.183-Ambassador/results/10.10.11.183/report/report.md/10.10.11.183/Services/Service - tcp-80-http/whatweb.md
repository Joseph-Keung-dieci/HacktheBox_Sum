```bash
whatweb --color=never --no-errors -a 3 -v http://10.10.11.183:80 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp80/tcp_80_http_whatweb.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp80/tcp_80_http_whatweb.txt):

```
WhatWeb report for http://10.10.11.183:80
Status    : 200 OK
Title     : Ambassador Development Server
IP        : 10.10.11.183
Country   : RESERVED, ZZ

Summary   : Apache[2.4.41], HTML5, HTTPServer[Ubuntu Linux][Apache/2.4.41 (Ubuntu)], MetaGenerator[Hugo 0.94.2], Open-Graph-Protocol[website], X-UA-Compatible[IE=edge]

Detected Plugins:
[ Apache ]
	The Apache HTTP Server Project is an effort to develop and
	maintain an open-source HTTP server for modern operating
	systems including UNIX and Windows NT. The goal of this
	project is to provide a secure, efficient and extensible
	server that provides HTTP services in sync with the current
	HTTP standards.

	Version      : 2.4.41 (from HTTP Server Header)
	Google Dorks: (3)
	Website     : http://httpd.apache.org/

[ HTML5 ]
	HTML version 5, detected by the doctype declaration


[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Ubuntu Linux
	String       : Apache/2.4.41 (Ubuntu) (from server string)

[ MetaGenerator ]
	This plugin identifies meta generator tags and extracts its
	value.

	String       : Hugo 0.94.2

[ Open-Graph-Protocol ]
	The Open Graph protocol enables you to integrate your Web
	pages into the social graph. It is currently designed for
	Web pages representing profiles of real-world things .
	things like movies, sports teams, celebrities, and
	restaurants. Including Open Graph tags on your Web page,
	makes your page equivalent to a Facebook Page.

	Version      : website

[ X-UA-Compatible ]
	This plugin retrieves the X-UA-Compatible value from the
	HTTP header and meta http-equiv tag. - More Info:
	http://msdn.microsoft.com/en-us/library/cc817574.aspx

	String       : IE=edge

HTTP Headers:
	HTTP/1.1 200 OK
	Date: Tue, 06 Dec 2022 03:22:03 GMT
	Server: Apache/2.4.41 (Ubuntu)
	Last-Modified: Fri, 02 Sep 2022 01:37:04 GMT
	ETag: "e46-5e7a7c4652f79-gzip"
	Accept-Ranges: bytes
	Vary: Accept-Encoding
	Content-Encoding: gzip
	Content-Length: 1310
	Connection: close
	Content-Type: text/html



```
