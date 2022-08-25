```bash
dig -p 53 -x 10.10.11.166 @10.10.11.166
```

[/home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp53/tcp_53_dns_reverse-lookup.txt](file:///home/kali/Desktop/HTB/HacktheBox/Machines/10.10.11.166-trick/results/10.10.11.166/scans/tcp53/tcp_53_dns_reverse-lookup.txt):

```

; <<>> DiG 9.18.4-2-Debian <<>> -p 53 -x 10.10.11.166 @10.10.11.166
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 36399
;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 3
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
; COOKIE: b2ec0502fcbbae8859e44fe762f789ae3a5fdbf30891dc2b (good)
;; QUESTION SECTION:
;166.11.10.10.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
166.11.10.10.in-addr.arpa. 604800 IN	PTR	trick.htb.

;; AUTHORITY SECTION:
11.10.10.in-addr.arpa.	604800	IN	NS	trick.htb.

;; ADDITIONAL SECTION:
trick.htb.		604800	IN	A	127.0.0.1
trick.htb.		604800	IN	AAAA	::1

;; Query time: 44 msec
;; SERVER: 10.10.11.166#53(10.10.11.166) (UDP)
;; WHEN: Sat Aug 13 07:23:26 EDT 2022
;; MSG SIZE  rcvd: 163


```
