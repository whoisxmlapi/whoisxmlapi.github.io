<?php

$domain = 'example.com';
$apiKey = 'your whois api key';

$url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
     . "domainName={$domain}&apiKey={$apiKey}";

print(file_get_contents($url));