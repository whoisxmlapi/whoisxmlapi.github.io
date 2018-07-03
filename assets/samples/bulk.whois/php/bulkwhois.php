<?php

$domains = ['google.com', 'youtube.com', 'facebook.com', 'whoisxmlapi.com'];
list($username, $password) = array('Your Bulk Whois Api login', 'password');
$url = 'https://www.whoisxmlapi.com/BulkWhoisLookup/bulkServices';

function api($path, array $data, $raw=false) {
    global $url, $password, $username;
    $header="Content-Type: application/json\r\nAccept: application/json\r\n";
    $params = compact('username', 'password') + array('outputFormat'=>'json');
    $opts = array('http' => array('method'  => 'POST', 'header' => $header));
    $opts['http']['content'] = json_encode($params + $data);
    $res = file_get_contents($url.$path, false, stream_context_create($opts));
    return $raw ? $res : json_decode($res);
}

$id = api('/bulkWhois', compact('domains'))->requestId;
$params = array('requestId' => $id, 'startIndex' => 5);
while (api('/getRecords', $params + array('maxRecords' => 0))->recordsLeft)
    sleep(5);
print(api('/download', $params, true));