```bash
curl -sSik http://10.10.11.124:80/
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/tcp80/tcp_80_http_curl.html](file:///home/parallels/HacktheBox/OSCP-like/Linux-Shibboleth/results/10.10.11.124/scans/tcp80/tcp_80_http_curl.html):

```
HTTP/1.1 302 Found
Date: Thu, 03 Nov 2022 05:51:00 GMT
Server: Apache/2.4.41 (Ubuntu)
Location: http://shibboleth.htb/
Content-Length: 284
Content-Type: text/html; charset=iso-8859-1

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>302 Found</title>
</head><body>
<h1>Found</h1>
<p>The document has moved <a href="http://shibboleth.htb/">here</a>.</p>
<hr>
<address>Apache/2.4.41 (Ubuntu) Server at 10.10.11.124 Port 80</address>
</body></html>


```
