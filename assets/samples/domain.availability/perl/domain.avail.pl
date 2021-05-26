#!/usr/bin/perl

my $domain = 'example.com';
my $apiKey = 'Your Domain Availability API Key';

my $url = 'https://domain-availability.whoisxmlapi.com/api/v1?'
        . "apiKey=$apiKey&domainName=$domain"

print get($url);
