<?php

$domain = 'example.com';
$key = 'your dns lookup api key';
$secret = 'your dns lookup api secret key';
$username = 'your dns lookup api username';

$time = round(microtime(true) * 1000);
$reqObj = urlencode(base64_encode("{\"t\":{$time},\"u\":\"{$username}\"}"));
$digest = urlencode(hash_hmac('md5', $username . $time . $key, $secret));

$url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
     . "requestObject={$reqObj}&digest={$digest}&domainName={$domain}"
     . "&type=_all";

print(file_get_contents($url));