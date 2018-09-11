#!/usr/bin/perl
use Package::Alias http =>'HTTP::Request', ua =>'LWP::UserAgent', js =>'JSON';

my $url = 'https://www.whoisxmlapi.com/BulkWhoisLookup/bulkServices';
my ($usr,$pass,$dom,$fm)=('Bulk Whois Api user','pass',['google.com'],'json');
#{%raw%}
sub post_data {
    my ($uri,$dt,$bs)=(@_,{username=>$usr,password=>$pass,outputFormat=>$fm});
    my ($ua, $req) = (ua->new(), http->new('POST', $url . $uri));
    $req->content(encode_json({%$bs, %$dt}));
    return js->new->decode($ua->request($req)->content);
}#{%endraw%}
my ($res, $i) = (post_data('/bulkWhois', {domains => $dom}), 'requestId');
$res->{messageCode} && ($res->{messageCode} !=200) && die $res->{messageCode};
my $arg = {$i => $res->{$i}, startIndex => @$dom + 1, maxRecords => 0};
while (post_data('/getRecords', $arg)->{recordsLeft} > 0) { sleep(3); }
($arg->{startIndex}, $arg->{maxRecords}) = (1, @$dom + 0);
print js->new->pretty->encode(post_data('/getRecords', $arg));