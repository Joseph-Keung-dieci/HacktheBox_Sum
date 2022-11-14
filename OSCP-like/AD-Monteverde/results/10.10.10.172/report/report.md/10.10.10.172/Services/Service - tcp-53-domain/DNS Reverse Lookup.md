```bash
dig -p 53 -x 10.10.10.172 @10.10.10.172
```

[/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp53/tcp_53_dns_reverse-lookup.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp53/tcp_53_dns_reverse-lookup.txt):

```
;; communications error to 10.10.10.172#53: timed out

; <<>> DiG 9.18.8-1-Debian <<>> -p 53 -x 10.10.10.172 @10.10.10.172
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 12364
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4000
;; QUESTION SECTION:
;172.10.10.10.in-addr.arpa.	IN	PTR

;; Query time: 3331 msec
;; SERVER: 10.10.10.172#53(10.10.10.172) (UDP)
;; WHEN: Mon Nov 14 11:26:21 AEDT 2022
;; MSG SIZE  rcvd: 54



```
