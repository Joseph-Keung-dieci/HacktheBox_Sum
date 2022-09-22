```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 32400 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/xml/tcp_32400_http_nmap.xml" 10.10.10.48
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_nmap.txt):

```
# Nmap 7.92 scan initiated Sun Sep 18 15:13:45 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 32400 "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN /home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/tcp_32400_http_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Mirai/results/10.10.10.48/scans/tcp32400/xml/tcp_32400_http_nmap.xml 10.10.10.48
Nmap scan report for 10.10.10.48
Host is up, received user-set (0.027s latency).
Scanned at 2022-09-18 15:13:45 AEST for 157s

PORT      STATE SERVICE REASON  VERSION
32400/tcp open  http    syn-ack Plex Media Server httpd
|_http-stored-xss: Couldn't find any stored XSS vulnerabilities.
|_http-jsonp-detection: Couldn't find any JSONP endpoints.
|_http-devframework: Couldn't determine the underlying framework or CMS. Try increasing 'httpspider.maxpagecount' value to spider more pages.
|_http-fetch: Please enter the complete path of the directory to save data in.
|_http-date: Sun, 18 Sep 2022 05:13:56 GMT; 0s from local time.
|_http-chrono: Request times for /; avg: 149.94ms; min: 149.16ms; max: 150.43ms
|_http-feed: Couldn't find any feeds.
| http-errors: 
| Spidering limited to: maxpagecount=40; withinhost=10.10.10.48
|   Found the following error pages: 
|   
|   Error Code: 401
|_  	http://10.10.10.48:32400/
|_http-mobileversion-checker: No mobile version detected.
|_http-dombased-xss: Couldn't find any DOM based XSS.
| http-enum: 
|   /weblog/: Blog
|   /weblogs/: Blog
|   /websvn/: WEBSVN Repository
|   /webedition/: Web Edition
|   /manager/: Possible admin folder
|   /webadmin/: Possible admin folder
|   /webadmin.html: Possible admin folder
|   /webadmin.php: Possible admin folder
|   /webadmin.cfm: Possible admin folder
|   /webadmin.asp: Possible admin folder
|   /webadmin.aspx: Possible admin folder
|   /webadmin.jsp: Possible admin folder
|   /clientaccesspolicy.xml: Microsoft Silverlight crossdomain policy
|   /webmail/: Mail folder
|   /crossdomain.xml: Adobe Flash crossdomain policy
|   /websql/: phpMyAdmin
|   /webadmin.nsf: Lotus Domino
|   /web.nsf: Lotus Domino
|   /weblink_cat_list.php: WHMCompleteSolution CMS
|   /management/: Potentially interesting folder
|   /security/: Potentially interesting folder
|   /web800fo/: Potentially interesting folder
|   /webaccess/: Potentially interesting folder
|   /webadmin/: Potentially interesting folder
|   /webAdmin/: Potentially interesting folder
|   /webalizer/: Potentially interesting folder
|   /webapps/: Potentially interesting folder
|   /webboard/: Potentially interesting folder
|   /webcart/: Potentially interesting folder
|   /webcart-lite/: Potentially interesting folder
|   /webcgi/: Potentially interesting folder
|   /webdata/: Potentially interesting folder
|   /webdav/: Potentially interesting folder
|   /webdb/: Potentially interesting folder
|   /webDB/: Potentially interesting folder
|   /webimages2/: Potentially interesting folder
|   /webimages/: Potentially interesting folder
|   /web-inf/: Potentially interesting folder
|   /webmaster/: Potentially interesting folder
|   /webmaster_logs/: Potentially interesting folder
|   /webMathematica/: Potentially interesting folder
|   /webpub/: Potentially interesting folder
|   /webpub-ui/: Potentially interesting folder
|   /webreports/: Potentially interesting folder
|   /webreps/: Potentially interesting folder
|   /webshare/: Potentially interesting folder
|   /website/: Potentially interesting folder
|   /webstat/: Potentially interesting folder
|   /webstats/: Potentially interesting folder
|   /webtrace/: Potentially interesting folder
|   /webtrends/: Potentially interesting folder
|_  /web_usage/: Potentially interesting folder
|_http-csrf: Couldn't find any CSRF vulnerabilities.
| http-useragent-tester: 
|   Status for browser useragent: 401
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
| http-auth: 
| HTTP/1.1 401 Unauthorized\x0D
|_  Server returned status 401 but no WWW-Authenticate header.
|_http-iis-webdav-vuln: Could not determine vulnerability, since root folder is password protected
|_http-wordpress-users: [Error] Wordpress installation was not found. We couldn't find wp-login.php
|_http-malware-host: Host appears to be clean
|_http-drupal-enum: Nothing found amongst the top 100 resources,use --script-args number=<number|all> for deeper analysis)
|_http-litespeed-sourcecode-download: Request with null byte did not work. This web server might not be vulnerable
|_http-config-backup: ERROR: Script execution failed (use -d to debug)
|_http-wordpress-enum: Nothing found amongst the top 100 resources,use --script-args search-limit=<number|all> for deeper analysis)
| http-vhosts: 
|_128 names had status 401
| http-auth-finder: 
| Spidering limited to: maxdepth=3; maxpagecount=20; withinhost=10.10.10.48
|   url                        method
|_  http://10.10.10.48:32400/  HTTP: Server returned no authentication headers.
|_http-cors: HEAD GET POST PUT DELETE OPTIONS
| http-security-headers: 
|   Cache_Control: 
|_    Header: Cache-Control: no-cache
| http-sitemap-generator: 
|   Directory structure:
|   Longest directory structure:
|     Depth: 0
|     Dir: /
|   Total files found (by extension):
|_    
|_http-favicon: Plex
|_http-title: Unauthorized
|_http-comments-displayer: Couldn't find any comments.
|_http-referer-checker: Couldn't find any cross-domain scripts.
| http-headers: 
|   Content-Length: 193
|   Content-Type: text/html
|   X-Plex-Protocol: 1.0
|   Cache-Control: no-cache
|   Date: Sun, 18 Sep 2022 05:14:07 GMT
|   
|_  (Request type: GET)

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Sun Sep 18 15:16:22 2022 -- 1 IP address (1 host up) scanned in 156.89 seconds

```
