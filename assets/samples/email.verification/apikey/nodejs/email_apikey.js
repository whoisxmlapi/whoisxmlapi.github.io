var crypto = require('crypto');
var http = require('http');

var email = 'support@whoisxmlapi.com';
var key = 'Your email verification api key';
var secret = 'Your email verification api secret key';
var username = 'Your email verification api username';

var time = (new Date).getTime();
var req = Buffer.from('{"t":'+time+',"u":"'+username+'"}').toString('base64');
var hmac = crypto.createHmac('md5', secret).update(username + time + key);
var digest = hmac.digest('hex');

var url = 'http://www.whoisxmlapi.com/whoisserver/EmailVerifyService?'
        + 'requestObject=' +req + '&digest=' +digest + '&emailAddress=' +email
        + '&checkCatchAll=1';

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();