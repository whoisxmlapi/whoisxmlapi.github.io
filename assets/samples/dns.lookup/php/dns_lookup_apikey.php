<?php

$domain = 'example.com';
$apiKey = 'Your DNS Lookup API Key';
$type = '_all';

$url = 'https://www.whoisxmlapi.com/whoisserver/DNSService?'
    . "apiKey={$apiKey}&domainName={$domain}&type={$type}";

print(file_get_contents($url));
