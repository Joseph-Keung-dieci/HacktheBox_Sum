```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 8080 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/xml/tcp_8080_http_nmap.xml" 10.10.10.227
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_nmap.txt):

```
# Nmap 7.92 scan initiated Fri Sep 23 13:51:38 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 8080 "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN /home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/tcp_8080_http_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Ophiuchi/results/10.10.10.227/scans/tcp8080/xml/tcp_8080_http_nmap.xml 10.10.10.227
Nmap scan report for 10.10.10.227
Host is up, received user-set (0.022s latency).
Scanned at 2022-09-23 13:51:39 AEST for 97s

Bug in http-security-headers: no string output.
PORT     STATE SERVICE REASON  VERSION
8080/tcp open  http    syn-ack Apache Tomcat 9.0.38
| http-headers: 
|   Set-Cookie: JSESSIONID=8841FFB89696869BC362ED1223FDA92E; Path=/; HttpOnly
|   Content-Type: text/html;charset=UTF-8
|   Transfer-Encoding: chunked
|   Date: Fri, 23 Sep 2022 03:51:47 GMT
|   Connection: close
|   
|_  (Request type: HEAD)
|_http-referer-checker: Couldn't find any cross-domain scripts.
|_http-drupal-enum: Nothing found amongst the top 100 resources,use --script-args number=<number|all> for deeper analysis)
| http-vhosts: 
|_128 names had status 200
|_http-wordpress-enum: Nothing found amongst the top 100 resources,use --script-args search-limit=<number|all> for deeper analysis)
| http-csrf: 
| Spidering limited to: maxdepth=3; maxpagecount=20; withinhost=10.10.10.227
|   Found the following possible CSRF vulnerabilities: 
|     
|     Path: http://10.10.10.227:8080/
|     Form id: data
|_    Form action: Servlet
|_http-jsonp-detection: Couldn't find any JSONP endpoints.
|_http-wordpress-users: [Error] Wordpress installation was not found. We couldn't find wp-login.php
| http-enum: 
|   /manager/html/upload: Apache Tomcat (401 )
|_  /manager/html: Apache Tomcat (401 )
|_http-errors: Couldn't find any error pages.
|_http-feed: Couldn't find any feeds.
|_http-date: Fri, 23 Sep 2022 03:51:46 GMT; -1s from local time.
| http-useragent-tester: 
|   Status for browser useragent: 200
|   Allowed User Agents: 
|     Mozilla/5.0 (compatible; Nmap Scripting Engine; https://nmap.org/book/nse.html)
|     libwww
|     lwp-trivial
|     libcurl-agent/1.0
|     PHP/
|     Python-urllib/2.5
|     GT::WWW
|     Snoopy
|     MFC_Tear_Sample
|     HTTP::Lite
|     PHPCrawl
|     URI::Fetch
|     Zend_Http_Client
|     http client
|     PECL::HTTP
|     Wget/1.13.4 (linux-gnu)
|_    WWW-Mechanize/1.34
|_http-stored-xss: Couldn't find any stored XSS vulnerabilities.
|_http-chrono: Request times for /; avg: 188.28ms; min: 153.37ms; max: 267.89ms
| http-default-accounts: 
|   [Apache Tomcat] at /manager/html/
|     (no valid default credentials found)
|   [Apache Tomcat Host Manager] at /host-manager/html/
|_    (no valid default credentials found)
|_http-devframework: Couldn't determine the underlying framework or CMS. Try increasing 'httpspider.maxpagecount' value to spider more pages.
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-malware-host: Host appears to be clean
|_http-title: Parse YAML
| http-comments-displayer: 
| Spidering limited to: maxdepth=3; maxpagecount=20; withinhost=10.10.10.227
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 72
|     Comment: 
|         /* TABS */
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 257
|     Comment: 
|         /* OTHERS */
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 191
|     Comment: 
|         /* Simple CSS3 Fade-in Animation */
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 85
|     Comment: 
|         /* FORM TYPOGRAPHY*/
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 35
|     Comment: 
|         /* STRUCTURE */
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 155
|     Comment: 
|         /* Simple CSS3 Fade-in-down Animation */
|     
|     Path: http://10.10.10.227:8080/
|     Line number: 153
|     Comment: 
|_        /* ANIMATIONS */
| http-waf-detect: IDS/IPS/WAF detected:
|_10.10.10.227:8080/?p4yl04d3=<script>alert(document.cookie)</script>
|_http-dombased-xss: Couldn't find any DOM based XSS.
|_http-fetch: Please enter the complete path of the directory to save data in.
|_http-litespeed-sourcecode-download: Request with null byte did not work. This web server might not be vulnerable
| http-php-version: Logo query returned unknown hash 2eaf1f2c2af96b28bcc456f256d932ce
|_Credits query returned unknown hash 2eaf1f2c2af96b28bcc456f256d932ce
|_http-mobileversion-checker: No mobile version detected.
| http-sitemap-generator: 
|   Directory structure:
|     /
|       Other: 2
|   Longest directory structure:
|     Depth: 0
|     Dir: /
|   Total files found (by extension):
|_    Other: 2
|_http-config-backup: ERROR: Script execution failed (use -d to debug)

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Sep 23 13:53:16 2022 -- 1 IP address (1 host up) scanned in 97.65 seconds

```
