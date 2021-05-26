#!/usr/bin/perl

use LWP::Simple;                # From CPAN
use JSON qw( decode_json );     # From CPAN
use Data::Dumper;
use strict;
use warnings;

my $email = "support@whoisxmlapi.com";
my $api_key = "your_api_key";
my $api_url = "https://emailverification.whoisxmlapi.com/api/v1";

my $url = "$api_url?apiKey=$api_key&emailAddress=$email";

getprint($url);
