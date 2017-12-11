<?php
    $emailAddress = 'support@whoisxmlapi.com';
    $apiKey = 'Your email verification api API_KEY';

    $url = "https://emailverification.whoisxmlapi.com/api/v1"
         . "?emailAddress={$emailAddress}&apiKey={$apiKey}";

    print(file_get_contents($url));