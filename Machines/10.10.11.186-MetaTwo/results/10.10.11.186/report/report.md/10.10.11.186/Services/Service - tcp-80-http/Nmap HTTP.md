```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 --script="banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN "/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp80/tcp_80_http_nmap.txt" -oX "/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp80/xml/tcp_80_http_nmap.xml" 10.10.11.186
```

[/home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp80/tcp_80_http_nmap.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp80/tcp_80_http_nmap.txt):

```
# Nmap 7.93 scan initiated Wed Dec  7 16:04:01 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 80 "--script=banner,(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)" -oN /home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp80/tcp_80_http_nmap.txt -oX /home/parallels/HacktheBox/Machines/10.10.11.186-MetaTwo/results/10.10.11.186/scans/tcp80/xml/tcp_80_http_nmap.xml 10.10.11.186
Nmap scan report for metapress.htb (10.10.11.186)
Host is up, received user-set (0.022s latency).
Scanned at 2022-12-07 16:04:01 AEDT for 161s

PORT   STATE SERVICE REASON  VERSION
80/tcp open  http    syn-ack nginx 1.18.0
| http-headers: 
|   Server: nginx/1.18.0
|   Date: Wed, 07 Dec 2022 05:04:09 GMT
|   Content-Type: text/html; charset=UTF-8
|   Connection: close
|   X-Powered-By: PHP/8.0.24
|   Set-Cookie: PHPSESSID=7cikf3nsaet67j5dfh32d20fce; path=/
|   Expires: Thu, 19 Nov 1981 08:52:00 GMT
|   Cache-Control: no-store, no-cache, must-revalidate
|   Pragma: no-cache
|   Link: <http://metapress.htb/wp-json/>; rel="https://api.w.org/"
|   
|_  (Request type: HEAD)
|_http-jsonp-detection: Couldn't find any JSONP endpoints.
|_http-title: MetaPress &#8211; Official company site
|_http-generator: WordPress 5.6.2
| http-php-version: Logo query returned unknown hash f6c0505e8a7d146ad6ccd9646a3ababe
| Credits query returned unknown hash f6c0505e8a7d146ad6ccd9646a3ababe
|_Version from header x-powered-by: PHP/8.0.24
| http-enum: 
|   /wp-login.php: Possible admin folder
|   /wp-json: Possible admin folder
|   /robots.txt: Robots file
|   /.htaccess: Incorrect permissions on .htaccess or .htpasswd files
|   /readme.html: Wordpress version: 2 
|   /: WordPress version: 5.6.2
|   /feed/: Wordpress version: 5.6.2
|   /wp-includes/images/rss.png: Wordpress version 2.2 found.
|   /wp-includes/js/jquery/suggest.js: Wordpress version 2.5 found.
|   /wp-includes/images/blank.gif: Wordpress version 2.6 found.
|   /wp-includes/js/comment-reply.js: Wordpress version 2.7 found.
|   /wp-login.php: Wordpress login page.
|   /wp-admin/upgrade.php: Wordpress login page.
|   /readme.html: Interesting, a readme.
|_  /0/: Potentially interesting folder
| http-sitemap-generator: 
|   Directory structure:
|     /
|       Other: 1; php: 1
|     /comments/feed/
|       Other: 1
|     /wp-includes/
|       xml: 1
|   Longest directory structure:
|     Depth: 2
|     Dir: /comments/feed/
|   Total files found (by extension):
|_    Other: 2; php: 1; xml: 1
| http-security-headers: 
|   Cache_Control: 
|     Header: Cache-Control: no-store, no-cache, must-revalidate
|   Pragma: 
|     Header: Pragma: no-cache
|   Expires: 
|_    Header: Expires: Thu, 19 Nov 1981 08:52:00 GMT
|_http-trane-info: Problem with XML parsing of /evox/about
|_http-malware-host: Host appears to be clean
|_http-chrono: Request times for /; avg: 480.98ms; min: 259.35ms; max: 617.87ms
| http-wordpress-users: 
| Username found: admin
| Username found: manager
|_Search stopped at ID #25. Increase the upper limit if necessary with 'http-wordpress-users.limit'
|_http-config-backup: ERROR: Script execution failed (use -d to debug)
| http-comments-displayer: 
| Spidering limited to: maxdepth=3; maxpagecount=20; withinhost=metapress.htb
|     
|     Path: http://metapress.htb:80/
|     Line number: 123
|     Comment: 
|         <!-- .widget-area -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 130
|     Comment: 
|         <!-- .site-name -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 75
|     Comment: 
|         <!-- .menu-button-container -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 137
|     Comment: 
|         <!-- #page -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 74
|     Comment: 
|         <!-- #primary-mobile-menu -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 102
|     Comment: 
|         <!-- #post-${ID} -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 77
|     Comment: 
|         <!-- #site-navigation -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 67
|     Comment: 
|         <!-- .site-branding -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 92
|     Comment: 
|         <!-- wp:paragraph -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 134
|     Comment: 
|         <!-- .site-info -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 79
|     Comment: 
|         <!-- #masthead -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 98
|     Comment: 
|         <!-- .entry-content -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 94
|     Comment: 
|         <!-- /wp:paragraph -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 135
|     Comment: 
|         <!-- #colophon -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 89
|     Comment: 
|         <!-- .entry-header -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 103
|     Comment: 
|         <!-- #main -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 104
|     Comment: 
|         <!-- #primary -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 105
|     Comment: 
|         <!-- #content -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 132
|     Comment: 
|         <!-- .powered-by -->
|     
|     Path: http://metapress.htb:80/
|     Line number: 101
|     Comment: 
|_        <!-- .entry-footer -->
|_http-wordpress-enum: Nothing found amongst the top 100 resources,use --script-args search-limit=<number|all> for deeper analysis)
| http-errors: 
| Spidering limited to: maxpagecount=40; withinhost=metapress.htb
|   Found the following error pages: 
|   
|   Error Code: 400
|_  	http://metapress.htb:80
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
|_http-referer-checker: Couldn't find any cross-domain scripts.
|_http-server-header: nginx/1.18.0
|_http-dombased-xss: Couldn't find any DOM based XSS.
| http-robots.txt: 1 disallowed entry 
|_/wp-admin/
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-mobileversion-checker: No mobile version detected.
| http-methods: 
|_  Supported Methods: GET HEAD POST
|_http-litespeed-sourcecode-download: Request with null byte did not work. This web server might not be vulnerable
| http-vhosts: 
|_128 names had status 302
|_http-stored-xss: Couldn't find any stored XSS vulnerabilities.
| http-csrf: 
| Spidering limited to: maxdepth=3; maxpagecount=20; withinhost=metapress.htb
|   Found the following possible CSRF vulnerabilities: 
|     
|     Path: http://metapress.htb:80/
|     Form id: search-form-1
|_    Form action: http://metapress.htb/
|_http-fetch: Please enter the complete path of the directory to save data in.
|_http-devframework: Wordpress detected. Found common traces on /
|_http-date: Wed, 07 Dec 2022 05:04:08 GMT; 0s from local time.
|_http-drupal-enum: Nothing found amongst the top 100 resources,use --script-args number=<number|all> for deeper analysis)
| http-feed: 
| Spidering limited to: maxpagecount=40; withinhost=metapress.htb
|   Found the following feeds: 
|     RSS (version 2.0): http://metapress.htb/feed/
|     RSS (version 2.0): http://metapress.htb:80/comments/feed/
|_    RSS (version 2.0): http://metapress.htb/comments/feed/

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Wed Dec  7 16:06:42 2022 -- 1 IP address (1 host up) scanned in 161.70 seconds

```
