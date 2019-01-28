var http = require('http');

var domain = 'example.com';
var password = 'Your domain availability api password';
var username = 'Your domain availability api username';

var url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
        + 'domainName=' + domain + '&username=' + username + '&password=' + password
        + '&cmd=GET_DN_AVAILABILITY' + '&getMode=DNS_AND_WHOIS';

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();