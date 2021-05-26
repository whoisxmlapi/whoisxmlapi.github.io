var http = require('http');

var domain = 'example.com';
var apiKey = 'Your DNS Lookup API public key';
var type = '_all';

var url = 'https://www.whoisxmlapi.com/whoisserver/DNSService?'
    + 'apiKey=' + apiKey + '&domainName=' + domain + '&type=' + type;

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();
