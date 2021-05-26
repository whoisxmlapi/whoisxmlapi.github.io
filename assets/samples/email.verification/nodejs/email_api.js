var http = require('http');

var email = 'support@whoisxmlapi.com';
var api_key = 'your_api_key';
var api_url = 'https://emailverification.whoisxmlapi.com/api/v1?';

var url = api_url + 'apiKey=' + api_key + '&emailAddress=' + email;

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();
