```bash
curl -sSik http://10.10.10.48:32400/
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_curl.html](file:///home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_curl.html):

```
HTTP/1.1 401 Unauthorized
Content-Length: 193
Content-Type: text/html
X-Plex-Protocol: 1.0
Cache-Control: no-cache
Date: Sun, 18 Sep 2022 05:13:45 GMT

<html><head><script>window.location = window.location.href.match(/(^.+\/)[^\/]*$/)[1] + 'web/index.html';</script><title>Unauthorized</title></head><body><h1>401 Unauthorized</h1></body></html>

```
