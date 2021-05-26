<?php
    $data = [
        'apiKey' => 'Your Brand Alert 2.0 API key',
        'mode' => 'preview',
        'includeSearchTerms' => ['facebook'],
    ];

    $stream = stream_context_create(
        [
            'http' => [
                'method' => 'POST',
                'header' => 'Content-Type: application/json/r/n',
                'content' => json_encode($data),
            ]
        ]
    );

    $url = "https://brand-alert.whoisxmlapi.com/api/v2";

    print(file_get_contents($url, false, $stream));
