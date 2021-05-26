#!/usr/bin/perl

my $domain = 'example.com';
my $apiKey = 'Your DNS Lookup API Key';
my $type = '_all';

my $url = 'https://www.whoisxmlapi.com/whoisserver/DNSService?'
        . "apiKey=$apiKey&domainName=$domain&type=$type"

print get($url);
