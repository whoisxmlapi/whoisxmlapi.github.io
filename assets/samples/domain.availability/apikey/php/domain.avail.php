<?php

$domain = 'example.com';
$key = 'your domain availability api key';
$secret = 'your domain availability api secret key';
$username = 'your domain availability api username';

$time = round(microtime(true) * 1000);
$reqObj = urlencode(base64_encode("{\"t\":{$time},\"u\":\"{$username}\"}"));
$digest = urlencode(hash_hmac('md5', $username . $time . $key, $secret));

$url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
     . "requestObject={$reqObj}&digest={$digest}&domainName={$domain}"
     . "&cmd=GET_DN_AVAILABILITY" . "&getMode=DNS_AND_WHOIS";

print(file_get_contents($url));