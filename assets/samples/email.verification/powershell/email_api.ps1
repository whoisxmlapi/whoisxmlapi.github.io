$email = "support@whoisxmlapi.com"
$api_key = "your_api_key"
$api_url = "https://emailverification.whoisxmlapi.com/api/v1?"

$uri = "$api_url" + "apiKey=$api_key" + "&emailAddress=$email"

$j = Invoke-WebRequest -Uri $uri
echo "JSON:`n---" $j.content "`n"
