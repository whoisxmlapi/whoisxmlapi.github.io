#!/usr/bin/perl

use LWP::UserAgent;              # From CPAN
use JSON;                        # From CPAN
use HTTP::Request;
use Encode qw( encode_utf8 );
use Data::Dumper;                # Perl core module
use strict;
use warnings;

my $url = "https://brand-alert.whoisxmlapi.com/api/v2";
my @terms = ["facebook"];
my $key = "Your Brand Alert 2.0 API key";
my $mode = 'preview';
my $body = {'apiKey'=>$key, 'mode'=>$mode, 'includeSearchTerms'=>@terms};
my $header = ['Content-Type' => 'application/json; charset=UTF-8'];

my $req = HTTP::Request->new(
    'POST', $url, $header, encode_utf8(encode_json($body))
);

my $ua = LWP::UserAgent->new();

print "Response ". $ua->request($req)->content();
