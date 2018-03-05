#!/usr/bin/perl

use LWP::Simple;

my $domain = 'example.com';
my $api_key = 'your whois api key';

my $url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
        . "domainName=$domain&apiKey=$api_key";

print get($url);