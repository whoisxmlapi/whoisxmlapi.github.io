$url = "https://brand-alert.whoisxmlapi.com/api/v2"

$data = @{apiKey="Your Brand Alert 2.0 API key"`
    ;mode="preview";includeSearchTerms=@('facebook')} | ConvertTo-Json
$r = Invoke-WebRequest -Uri $url -Method POST -Body $data
echo "JSON:`n---" $r.content "`n"
