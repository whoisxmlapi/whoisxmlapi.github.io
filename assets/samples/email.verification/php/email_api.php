<?php
$email = 'support@whoisxmlapi.com';
$api_key = 'your_api_key';
$api_url = 'https://emailverification.whoisxmlapi.com/api/v1';

$url = "{$api_url}?apiKey={$api_key}&emailAddress={$email}";

print(file_get_contents($url));
