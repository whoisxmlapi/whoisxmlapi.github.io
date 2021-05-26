var http = require('http');

var domain = 'example.com';
var apiKey = 'Your domain availability api public key';

var url = 'https://domain-availability.whoisxmlapi.com/api/v1?'
    + 'apiKey=' + apiKey + '&domainName=' + domain;

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();
