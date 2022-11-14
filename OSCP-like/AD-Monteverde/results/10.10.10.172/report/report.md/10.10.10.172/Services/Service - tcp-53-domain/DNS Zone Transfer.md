```bash
dig AXFR -p 53 @10.10.10.172
```

[/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp53/tcp_53_dns_zone-transfer.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp53/tcp_53_dns_zone-transfer.txt):

```
;; communications error to 10.10.10.172#53: timed out

; <<>> DiG 9.18.8-1-Debian <<>> AXFR -p 53 @10.10.10.172
; (1 server found)
;; global options: +cmd
;; Query time: 3331 msec
;; SERVER: 10.10.10.172#53(10.10.10.172) (UDP)
;; WHEN: Mon Nov 14 11:26:21 AEDT 2022
;; MSG SIZE  rcvd: 28



```
