```bash
whatweb --color=never --no-errors -a 3 -v http://10.10.11.124:80 2>&1
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/tcp80/tcp_80_http_whatweb.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/tcp80/tcp_80_http_whatweb.txt):

```
WhatWeb report for http://10.10.11.124:80
Status    : 302 Found
Title     : 302 Found
IP        : 10.10.11.124
Country   : RESERVED, ZZ

Summary   : Apache[2.4.41], HTTPServer[Ubuntu Linux][Apache/2.4.41 (Ubuntu)], RedirectLocation[http://shibboleth.htb/]

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

[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Ubuntu Linux
	String       : Apache/2.4.41 (Ubuntu) (from server string)

[ RedirectLocation ]
	HTTP Server string location. used with http-status 301 and
	302

	String       : http://shibboleth.htb/ (from location)

HTTP Headers:
	HTTP/1.1 302 Found
	Date: Thu, 03 Nov 2022 05:51:02 GMT
	Server: Apache/2.4.41 (Ubuntu)
	Location: http://shibboleth.htb/
	Content-Length: 284
	Connection: close
	Content-Type: text/html; charset=iso-8859-1

WhatWeb report for http://shibboleth.htb/
Status    : 200 OK
Title     : FlexStart Bootstrap Template - Index
IP        : 10.10.11.124
Country   : RESERVED, ZZ

Summary   : Apache[2.4.41], Bootstrap, Email[contact@example.com,info@example.com], HTML5, HTTPServer[Ubuntu Linux][Apache/2.4.41 (Ubuntu)], Lightbox, PoweredBy[enterprise], Script

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

[ Bootstrap ]
	Bootstrap is an open source toolkit for developing with
	HTML, CSS, and JS.

	Website     : https://getbootstrap.com/

[ Email ]
	Extract email addresses. Find valid email address and
	syntactically invalid email addresses from mailto: link
	tags. We match syntactically invalid links containing
	mailto: to catch anti-spam email addresses, eg. bob at
	gmail.com. This uses the simplified email regular
	expression from
	http://www.regular-expressions.info/email.html for valid
	email address matching.

	String       : contact@example.com,info@example.com

[ HTML5 ]
	HTML version 5, detected by the doctype declaration


[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Ubuntu Linux
	String       : Apache/2.4.41 (Ubuntu) (from server string)

[ Lightbox ]
	Javascript for nice image popups


[ PoweredBy ]
	This plugin identifies instances of 'Powered by x' text and
	attempts to extract the value for x.

	String       : enterprise

[ Script ]
	This plugin detects instances of script HTML elements and
	returns the script language/type.


HTTP Headers:
	HTTP/1.1 200 OK
	Date: Thu, 03 Nov 2022 05:51:03 GMT
	Server: Apache/2.4.41 (Ubuntu)
	Last-Modified: Tue, 27 Apr 2021 15:38:05 GMT
	ETag: "e852-5c0f60c60a3c3-gzip"
	Accept-Ranges: bytes
	Vary: Accept-Encoding
	Content-Encoding: gzip
	Content-Length: 9239
	Connection: close
	Content-Type: text/html



```
