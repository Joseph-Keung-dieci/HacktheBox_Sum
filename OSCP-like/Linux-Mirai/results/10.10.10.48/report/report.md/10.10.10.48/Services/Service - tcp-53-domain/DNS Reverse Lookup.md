```bash
dig -p 53 -x 10.10.10.48 @10.10.10.48
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp53/tcp_53_dns_reverse-lookup.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp53/tcp_53_dns_reverse-lookup.txt):

```

; <<>> DiG 9.18.4-2-Debian <<>> -p 53 -x 10.10.10.48 @10.10.10.48
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 33131
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;48.10.10.10.in-addr.arpa.	IN	PTR

;; Query time: 32 msec
;; SERVER: 10.10.10.48#53(10.10.10.48) (UDP)
;; WHEN: Sun Sep 18 15:13:32 AEST 2022
;; MSG SIZE  rcvd: 53


```
