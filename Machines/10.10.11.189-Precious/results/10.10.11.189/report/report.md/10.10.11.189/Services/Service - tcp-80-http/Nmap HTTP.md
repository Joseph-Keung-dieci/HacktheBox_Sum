```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/tcp_80_http_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/xml/tcp_80_http_nmap.xml" 10.10.11.189
```

[/home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/tcp_80_http_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/tcp_80_http_nmap.txt):

```
# Nmap 7.93 scan initiated Fri Dec  2 16:45:12 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/tcp_80_http_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.189-Precious/results/10.10.11.189/scans/tcp80/xml/tcp_80_http_nmap.xml 10.10.11.189
Nmap scan report for precious.htb (10.10.11.189)
Host is up, received user-set (0.027s latency).
Scanned at 2022-12-02 16:45:12 AEDT for 191s

PORT   STATE SERVICE REASON  VERSION
80/tcp open  http    syn-ack nginx 1.18.0
| http-useragent-tester: 
|   Status for browser useragent: 200
|   Allowed User Agents: 
|     libwww
|     lwp-trivial
|     libcurl-agent/1.0
|     PHP/
|     Python-urllib/2.5
|     Snoopy
|     MFC_Tear_Sample
|     HTTP::Lite
|     PHPCrawl
|     Zend_Http_Client
|     http client
|     PECL::HTTP
|     Wget/1.13.4 (linux-gnu)
|_    WWW-Mechanize/1.34
| http-vhosts: 
| ap.htb
| citrix.htb
| vm.htb
| host.htb
| ssh.htb
| ns3.htb
| voip.htb
| shop.htb
| devtest.htb
| apps.htb
|_118 names had status 302
| http-csrf: 
| Spidering limited to: maxdepth=3; maxpagecount=20; withinhost=precious.htb
|   Found the following possible CSRF vulnerabilities: 
|     
|     Path: http://precious.htb:80/
|     Form id: 
|_    Form action: /
|_http-wordpress-users: [Error] Wordpress installation was not found. We couldn't find wp-login.php
|_http-chrono: Request times for /; avg: 431.63ms; min: 151.70ms; max: 1179.28ms
|_http-comments-displayer: Couldn't find any comments.
|_http-errors: Couldn't find any error pages.
|_http-fetch: Please enter the complete path of the directory to save data in.
|_http-litespeed-sourcecode-download: Request with null byte did not work. This web server might not be vulnerable
|_http-referer-checker: Couldn't find any cross-domain scripts.
| http-methods: 
|_  Supported Methods: GET HEAD POST
|_http-dombased-xss: Couldn't find any DOM based XSS.
| http-server-header: 
|   nginx/1.18.0
|_  nginx/1.18.0 + Phusion Passenger(R) 6.0.15
|_http-title: Convert Web Page to PDF
| http-php-version: Logo query returned unknown hash bc71b1f837887f31a465fb4e71c42f38
|_Credits query returned unknown hash bc71b1f837887f31a465fb4e71c42f38
|_http-wordpress-enum: Nothing found amongst the top 100 resources,use --script-args search-limit=<number|all> for deeper analysis)
| http-headers: 
|   Content-Type: text/html;charset=utf-8
|   Content-Length: 483
|   Connection: close
|   Status: 200 OK
|   X-XSS-Protection: 1; mode=block
|   X-Content-Type-Options: nosniff
|   X-Frame-Options: SAMEORIGIN
|   Date: Fri, 02 Dec 2022 05:45:24 GMT
|   X-Powered-By: Phusion Passenger(R) 6.0.15
|   Server: nginx/1.18.0 + Phusion Passenger(R) 6.0.15
|   X-Runtime: Ruby
|   
|_  (Request type: HEAD)
|_http-config-backup: ERROR: Script execution failed (use -d to debug)
|_http-stored-xss: Couldn't find any stored XSS vulnerabilities.
| http-sitemap-generator: 
|   Directory structure:
|     /
|       Other: 1
|     /stylesheets/
|       css: 1
|   Longest directory structure:
|     Depth: 1
|     Dir: /stylesheets/
|   Total files found (by extension):
|_    Other: 1; css: 1
|_http-drupal-enum: Nothing found amongst the top 100 resources,use --script-args number=<number|all> for deeper analysis)
|_http-mobileversion-checker: No mobile version detected.
|_http-jsonp-detection: Couldn't find any JSONP endpoints.
|_http-devframework: RoR detected. Found 'passenger' in x-powered-by header sent by the server.
|_http-feed: Couldn't find any feeds.
| http-security-headers: 
|   X_Frame_Options: 
|     Header: X-Frame-Options: SAMEORIGIN
|     Description: The browser must not display this content in any frame from a page of different origin than the content itself.
|   X_XSS_Protection: 
|     Header: X-XSS-Protection: 1; mode=block
|     Description: The browser will prevent the rendering of the page when XSS is detected.
|   X_Content_Type_Options: 
|     Header: X-Content-Type-Options: nosniff
|_    Description: Will prevent the browser from MIME-sniffing a response away from the declared content-type. 
|_http-malware-host: Host appears to be clean
|_http-date: Fri, 02 Dec 2022 05:45:20 GMT; 0s from local time.

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Dec  2 16:48:23 2022 -- 1 IP address (1 host up) scanned in 191.96 seconds

```
