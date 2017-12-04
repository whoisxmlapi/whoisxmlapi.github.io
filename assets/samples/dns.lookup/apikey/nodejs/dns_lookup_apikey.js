var crypto = require('crypto');
var http = require('http');

var domain = 'example.com';
var key = 'your dns lookup api key';
var secret = 'your dns lookup api secret key';
var username = 'your dns lookup api username';

var time = (new Date).getTime();
var req = Buffer.from('{"t":'+time+',"u":"'+username+'"}').toString('base64');
var hmac = crypto.createHmac('md5', secret).update(username + time + key);
var digest = hmac.digest('hex');

var url = 'http://www.whoisxmlapi.com/whoisserver/DNSService?'
        + 'requestObject=' +req + '&digest=' +digest + '&domainName=' +domain
        + '&type=_all';

http.get(url, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
}).end();