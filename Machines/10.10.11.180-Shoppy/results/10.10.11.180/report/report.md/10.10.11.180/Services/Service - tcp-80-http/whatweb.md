```bash
whatweb --color=never --no-errors -a 3 -v http://10.10.11.180:80 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.180-Shoppy/results/10.10.11.180/scans/tcp80/tcp_80_http_whatweb.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.180-Shoppy/results/10.10.11.180/scans/tcp80/tcp_80_http_whatweb.txt):

```
WhatWeb report for http://10.10.11.180:80
Status    : 301 Moved Permanently
Title     : 301 Moved Permanently
IP        : 10.10.11.180
Country   : RESERVED, ZZ

Summary   : HTTPServer[nginx/1.23.1], nginx[1.23.1], RedirectLocation[http://shoppy.htb]

Detected Plugins:
[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	String       : nginx/1.23.1 (from server string)

[ RedirectLocation ]
	HTTP Server string location. used with http-status 301 and
	302

	String       : http://shoppy.htb (from location)

[ nginx ]
	Nginx (Engine-X) is a free, open-source, high-performance
	HTTP server and reverse proxy, as well as an IMAP/POP3
	proxy server.

	Version      : 1.23.1
	Website     : http://nginx.net/

HTTP Headers:
	HTTP/1.1 301 Moved Permanently
	Server: nginx/1.23.1
	Date: Tue, 22 Nov 2022 00:22:09 GMT
	Content-Type: text/html
	Content-Length: 169
	Connection: close
	Location: http://shoppy.htb



```
