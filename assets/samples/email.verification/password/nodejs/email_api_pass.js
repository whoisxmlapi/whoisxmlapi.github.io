var http = require('http');

var email = 'support@whoisxmlapi.com';
var password = 'your email verification api password';
var username = 'your email verification api username';

var url = 'https://www.whoisxmlapi.com/whoisserver/EmailVerifyService?' +
    'emailAddress=' + email +
    '&validateDNS=true' +
    '&validateSMTP=true' +
    '&checkCatchAll=true' +
    '&checkFree=true' +
    '&checkDisposable=true' +
    '&username=' + username +
    '&password=' + password +
    '&outputFormat=' + format;

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();