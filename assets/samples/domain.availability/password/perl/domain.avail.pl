#!/usr/bin/perl

use LWP::Simple;

my $domain = 'example.com';
my $password = 'your domain availability api password';
my $username = 'your domain availability api username';

my $url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'
        . "domainName=$domain&userName=$userName&password=$password"
        . "&cmd=GET_DN_AVAILABILITY" . "&getMode=DNS_AND_WHOIS";

print get($url);