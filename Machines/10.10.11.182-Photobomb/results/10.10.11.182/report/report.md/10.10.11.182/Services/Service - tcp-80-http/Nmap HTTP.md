```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.182-Photobomb/results/10.10.11.182/scans/tcp80/tcp_80_http_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.182-Photobomb/results/10.10.11.182/scans/tcp80/xml/tcp_80_http_nmap.xml" 10.10.11.182
```

[/home/parallels/HacktheBox/Machines/10.10.11.182-Photobomb/results/10.10.11.182/scans/tcp80/tcp_80_http_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.182-Photobomb/results/10.10.11.182/scans/tcp80/tcp_80_http_nmap.txt):

```
# Nmap 7.93 scan initiated Tue Nov 22 16:39:39 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.182-Photobomb/results/10.10.11.182/scans/tcp80/tcp_80_http_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.182-Photobomb/results/10.10.11.182/scans/tcp80/xml/tcp_80_http_nmap.xml 10.10.11.182
Nmap scan report for 10.10.11.182
Host is up, received user-set (0.036s latency).
Scanned at 2022-11-22 16:39:40 AEDT for 71s

Bug in http-security-headers: no string output.
PORT   STATE SERVICE REASON  VERSION
80/tcp open  http    syn-ack nginx 1.18.0 (Ubuntu)
| http-sitemap-generator: 
|   Directory structure:
|   Longest directory structure:
|     Depth: 0
|     Dir: /
|   Total files found (by extension):
|_    
| http-useragent-tester: 
|   Status for browser useragent: false
|   Redirected To: http://photobomb.htb/
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
| http-vhosts: 
|_128 names had status 302
|_http-errors: Couldn't find any error pages.
|_http-feed: Couldn't find any feeds.
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-drupal-enum: Nothing found amongst the top 100 resources,use --script-args number=<number|all> for deeper analysis)
|_http-title: Did not follow redirect to http://photobomb.htb/
| http-headers: 
|   Server: nginx/1.18.0 (Ubuntu)
|   Date: Tue, 22 Nov 2022 05:39:52 GMT
|   Content-Type: text/html
|   Content-Length: 154
|   Connection: close
|   Location: http://photobomb.htb/
|   
|_  (Request type: GET)
|_http-dombased-xss: Couldn't find any DOM based XSS.
|_http-wordpress-enum: Nothing found amongst the top 100 resources,use --script-args search-limit=<number|all> for deeper analysis)
|_http-mobileversion-checker: No mobile version detected.
|_http-stored-xss: Couldn't find any stored XSS vulnerabilities.
|_http-devframework: Couldn't determine the underlying framework or CMS. Try increasing 'httpspider.maxpagecount' value to spider more pages.
|_http-date: Tue, 22 Nov 2022 05:39:47 GMT; +1s from local time.
|_http-csrf: Couldn't find any CSRF vulnerabilities.
|_http-referer-checker: Couldn't find any cross-domain scripts.
|_http-fetch: Please enter the complete path of the directory to save data in.
|_http-litespeed-sourcecode-download: Request with null byte did not work. This web server might not be vulnerable
|_http-chrono: Request times for /; avg: 14.64ms; min: 13.45ms; max: 16.42ms
|_http-comments-displayer: Couldn't find any comments.
|_http-jsonp-detection: Couldn't find any JSONP endpoints.
|_http-wordpress-users: [Error] Wordpress installation was not found. We couldn't find wp-login.php
|_http-config-backup: ERROR: Script execution failed (use -d to debug)
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Tue Nov 22 16:40:51 2022 -- 1 IP address (1 host up) scanned in 71.82 seconds

```
