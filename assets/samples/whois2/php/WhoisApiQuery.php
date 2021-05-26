<?php

$domainName = 'whoisxmlapi.com';
$apiKey = 'Your API key';

$url = "https://www.whoisxmlapi.com/whoisserver/WhoisService"
    . "?domainName={$domainName}&apiKey={$apiKey}&outputFormat=JSON";

print(file_get_contents($url));

