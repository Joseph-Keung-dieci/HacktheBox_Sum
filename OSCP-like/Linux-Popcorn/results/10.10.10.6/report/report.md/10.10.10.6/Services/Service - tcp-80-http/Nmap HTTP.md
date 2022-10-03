```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/xml/tcp_80_http_nmap.xml" 10.10.10.6
```

[/home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_nmap.txt):

```
# Nmap 7.92 scan initiated Wed Sep 21 20:36:44 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN /home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/tcp_80_http_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/Linux-Popcorn/results/10.10.10.6/scans/tcp80/xml/tcp_80_http_nmap.xml 10.10.10.6
Nmap scan report for 10.10.10.6
Host is up, received user-set (0.026s latency).
Scanned at 2022-09-21 20:36:44 AEST for 37s

Bug in http-security-headers: no string output.
PORT   STATE SERVICE REASON  VERSION
80/tcp open  http    syn-ack Apache httpd 2.2.12 ((Ubuntu))
|_http-stored-xss: Couldn't find any stored XSS vulnerabilities.
|_http-config-backup: ERROR: Script execution failed (use -d to debug)
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
|_http-errors: Couldn't find any error pages.
|_http-wordpress-enum: Nothing found amongst the top 100 resources,use --script-args search-limit=<number|all> for deeper analysis)
| http-vhosts: 
| 127 names had status 200
|_download
|_http-jsonp-detection: Couldn't find any JSONP endpoints.
| http-headers: 
|   Date: Wed, 21 Sep 2022 10:36:56 GMT
|   Server: Apache/2.2.12 (Ubuntu)
|   Last-Modified: Fri, 17 Mar 2017 17:07:05 GMT
|   ETag: "aa65-b1-54af035029fd5"
|   Accept-Ranges: bytes
|   Content-Length: 177
|   Vary: Accept-Encoding
|   Connection: close
|   Content-Type: text/html
|   
|_  (Request type: HEAD)
|_http-server-header: Apache/2.2.12 (Ubuntu)
|_http-devframework: Couldn't determine the underlying framework or CMS. Try increasing 'httpspider.maxpagecount' value to spider more pages.
|_http-csrf: Couldn't find any CSRF vulnerabilities.
|_http-date: Wed, 21 Sep 2022 10:36:56 GMT; +3s from local time.
|_http-title: Site doesn't have a title (text/html).
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-referer-checker: Couldn't find any cross-domain scripts.
| http-enum: 
|   /test/: Test page
|   /test.php: Test page
|   /test/logon.html: Jetty
|_  /icons/: Potentially interesting folder w/ directory listing
|_http-chrono: Request times for /; avg: 155.19ms; min: 153.20ms; max: 156.72ms
|_http-dombased-xss: Couldn't find any DOM based XSS.
| http-vuln-cve2011-3192: 
|   VULNERABLE:
|   Apache byterange filter DoS
|     State: VULNERABLE
|     IDs:  CVE:CVE-2011-3192  BID:49303
|       The Apache web server is vulnerable to a denial of service attack when numerous
|       overlapping byte ranges are requested.
|     Disclosure date: 2011-08-19
|     References:
|       https://www.securityfocus.com/bid/49303
|       https://www.tenable.com/plugins/nessus/55976
|       https://seclists.org/fulldisclosure/2011/Aug/175
|_      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-3192
|_http-feed: Couldn't find any feeds.
|_http-drupal-enum: Nothing found amongst the top 100 resources,use --script-args number=<number|all> for deeper analysis)
|_http-fetch: Please enter the complete path of the directory to save data in.
|_http-comments-displayer: Couldn't find any comments.
|_http-wordpress-users: [Error] Wordpress installation was not found. We couldn't find wp-login.php
|_http-malware-host: Host appears to be clean
|_http-mobileversion-checker: No mobile version detected.
| http-sitemap-generator: 
|   Directory structure:
|     /
|       Other: 1
|   Longest directory structure:
|     Depth: 0
|     Dir: /
|   Total files found (by extension):
|_    Other: 1
| http-php-version: Logo query returned unknown hash 21dde95d9d269cbb2fa6560309dca40c
|_Credits query returned unknown hash 21dde95d9d269cbb2fa6560309dca40c

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Sep 21 20:37:21 2022 -- 1 IP address (1 host up) scanned in 37.52 seconds

```