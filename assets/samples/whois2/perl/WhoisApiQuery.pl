#!/usr/bin/perl

use LWP::Simple;                # From CPAN
use JSON qw( decode_json );     # From CPAN
use Data::Dumper;               # Perl core module
use strict;                     # Good practice
use warnings;                   # Good practice

########################
# Fill in your details #
########################
my $api_key = "Your API key";

my $domain_name = 'whoisxmlapi.com';
my $base_url = 'https://www.whoisxmlapi.com/whoisserver/WhoisService';


print "result\n" . getWhoisRecord();

sub getWhoisRecord {
    my $url = "$base_url?apiKey=$api_key&domainName=$domain_name&outputFormat=JSON";

    print "Get data by URL: $url\n";
    # 'get' is exported by LWP::Simple;
    my $object = get($url);
    die "Could not get $base_url!" unless defined $object;
    return $object
}
