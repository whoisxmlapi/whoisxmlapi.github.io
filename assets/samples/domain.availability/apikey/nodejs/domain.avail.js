var crypto = require('crypto');
var http = require('http');

var domain = 'example.com';
var key = 'Your domain availability api public key';
var secret = 'Your domain availability api secret key';
var username = 'Your domain availability api username';

var time = (new Date).getTime();
var req = Buffer.from('{"t":'+time+',"u":"'+username+'"}').toString('base64');
var hmac = crypto.createHmac('md5', secret).update(username + time + key);
var digest = hmac.digest('hex');

var url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
        + 'requestObject=' +req + '&digest=' +digest + '&domainName=' +domain
        + '&cmd=GET_DN_AVAILABILITY';

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();