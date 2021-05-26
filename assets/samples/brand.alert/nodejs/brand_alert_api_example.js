const http = require('https');

const key = 'Your Brand Alert 2.0 API key';
const terms = ["facebook"];
const mode = "preview";
const host = 'brand-alert.whoisxmlapi.com';
const path = '/api/v2';
const data = {
    apiKey: key,
    includeSearchTerms: terms,
    mode: mode
};
const options = {
    method: "POST",
    hostname: host,
    path: path
};
var req = http.request(options, function(response) {
    var str = '';
    response.on('data', function(chunk) { str += chunk; });
    response.on('end', function() { console.log(str); });
});
req.write(JSON.stringify(data));
req.end();
