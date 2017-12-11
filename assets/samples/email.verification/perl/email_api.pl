#!/usr/bin/perl

use LWP::Simple;                # From CPAN
use JSON qw( decode_json );     # From CPAN
use Data::Dumper;
use strict;
use warnings;

my $api_key = "Your email verification api API_KEY";

my $emailAddress = 'support@whoisxmlapi.com';
my $base_url = 'https://emailverification.whoisxmlapi.com/api/v1';

my $url = "$base_url?emailAddress=$emailAddress&apiKey=$api_key";
getprint($url);