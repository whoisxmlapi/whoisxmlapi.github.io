var http = require('http');

var email = 'support@whoisxmlapi.com';
var apiKey = 'Your email verification api API_KEY';

var url = 'https://emailverification.whoisxmlapi.com/api/v1?' +
    'emailAddress=' + email +
    '&apiKey=' + apikey;

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();