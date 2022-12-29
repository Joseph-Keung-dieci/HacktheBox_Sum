```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 3306 --script="banner,(mysql* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp3306/tcp_3306_mysql_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp3306/xml/tcp_3306_mysql_nmap.xml" 10.10.11.183
```

[/home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp3306/tcp_3306_mysql_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp3306/tcp_3306_mysql_nmap.txt):

```
# Nmap 7.93 scan initiated Tue Dec  6 14:22:03 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 3306 "--script=banner,(mysql* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp3306/tcp_3306_mysql_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.183-Ambassador/results/10.10.11.183/scans/tcp3306/xml/tcp_3306_mysql_nmap.xml 10.10.11.183
Nmap scan report for 10.10.11.183
Host is up, received user-set (0.027s latency).
Scanned at 2022-12-06 14:22:09 AEDT for 100s

PORT     STATE SERVICE REASON  VERSION
3306/tcp open  mysql   syn-ack MySQL 8.0.30-0ubuntu0.20.04.2
|_ssl-date: TLS randomness does not represent time
| banner: [\x00\x00\x00\x0A8.0.30-0ubuntu0.20.04.2\x00-\x00\x00\x00\x09o\
| x1B}lK&\x02\x00\xFF\xFF\xFF\x02\x00\xFF\xDF\x15\x00\x00\x00\x00\x00\x00
|_\x00\x00\x00\x00l7a]\x1FM5z)0\x06\x09\x00caching_sha2_password\x00
| mysql-info: 
|   Protocol: 10
|   Version: 8.0.30-0ubuntu0.20.04.2
|   Thread ID: 44
|   Capabilities flags: 65535
|   Some Capabilities: Support41Auth, ConnectWithDatabase, SupportsLoadDataLocal, ODBCClient, SupportsCompression, SupportsTransactions, IgnoreSpaceBeforeParenthesis, FoundRows, LongPassword, IgnoreSigpipes, SwitchToSSLAfterHandshake, InteractiveClient, Speaks41ProtocolNew, DontAllowDatabaseTableColumn, Speaks41ProtocolOld, LongColumnFlag, SupportsMultipleResults, SupportsAuthPlugins, SupportsMultipleStatments
|   Status: Autocommit
|   Salt: \x07Jk\x04\x1A7Eq|M\x15&)HY)(>8\
|_  Auth Plugin Name: caching_sha2_password

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Tue Dec  6 14:23:49 2022 -- 1 IP address (1 host up) scanned in 105.82 seconds

```
