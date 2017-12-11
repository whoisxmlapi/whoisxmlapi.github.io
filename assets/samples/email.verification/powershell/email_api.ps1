$apiKey = "Your email verification api API_KEY"

$emailAddress = "support@whoisxmlapi.com"

$uri = "https://emailverification.whoisxmlapi.com/api/v1?"`
    + "emailAddress=$emailAddress"`
    + "&apiKey=$apiKey"

$j = Invoke-WebRequest -Uri $uri
echo "JSON:`n---" $j.content "`n"