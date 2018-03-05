var http = require('http');

var domain = 'example.com';
var apiKey = 'your whois api key';

var url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
        + 'domainName=' + domain + '&apiKey=' + apiKey;

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();