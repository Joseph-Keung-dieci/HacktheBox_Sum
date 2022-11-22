```bash
smbmap -H 10.10.11.174 -P 139 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-share-permissions.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-share-permissions.txt):

```
[!] RPC Authentication error occurred
[!] Authentication error on 10.10.11.174


```
```bash
smbmap -u null -p "" -H 10.10.11.174 -P 139 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-share-permissions.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-share-permissions.txt):

```
[!] RPC Authentication error occurred
[!] Authentication error on 10.10.11.174


```
```bash
smbmap -H 10.10.11.174 -P 139 -R 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-list-contents.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-list-contents.txt):

```
[!] RPC Authentication error occurred
[!] Authentication error on 10.10.11.174


```
```bash
smbmap -u null -p "" -H 10.10.11.174 -P 139 -R 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-list-contents.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-list-contents.txt):

```
[!] RPC Authentication error occurred
[!] Authentication error on 10.10.11.174


```
```bash
smbmap -H 10.10.11.174 -P 139 -x "ipconfig /all" 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-execute-command.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-execute-command.txt):

```
[!] RPC Authentication error occurred
[!] Authentication error on 10.10.11.174


```
```bash
smbmap -u null -p "" -H 10.10.11.174 -P 139 -x "ipconfig /all" 2>&1
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-execute-command.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp139/smbmap-execute-command.txt):

```
[!] RPC Authentication error occurred
[!] Authentication error on 10.10.11.174


```
