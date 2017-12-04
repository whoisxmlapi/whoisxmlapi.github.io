<?php

$domain = 'example.com';
$password = 'your dns lookup api password';
$username = 'your dns lookup api username';

$url ="http://www.whoisxmlapi.com/whoisserver/DNSService?domainName={$domain}"
     ."&username={$username}&password={$password}&type=A,SOA,TXT";

print(file_get_contents($url));