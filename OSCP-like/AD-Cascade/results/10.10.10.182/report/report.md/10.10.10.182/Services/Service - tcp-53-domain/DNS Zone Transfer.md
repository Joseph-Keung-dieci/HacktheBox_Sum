```bash
dig AXFR -p 53 @10.10.10.182
```

[/home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_zone-transfer.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Cascade/results/10.10.10.182/scans/tcp53/tcp_53_dns_zone-transfer.txt):

```

; <<>> DiG 9.18.8-1-Debian <<>> AXFR -p 53 @10.10.10.182
; (1 server found)
;; global options: +cmd
;; Query time: 23 msec
;; SERVER: 10.10.10.182#53(10.10.10.182) (UDP)
;; WHEN: Fri Nov 18 15:56:55 AEDT 2022
;; MSG SIZE  rcvd: 40


```
