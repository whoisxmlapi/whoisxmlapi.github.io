$domain = "example.com"
$apiKey = "your whois api key"

$uri = "https://www.whoisxmlapi.com/whoisserver/WhoisService?"`
     + "domainName=$($domain)&apiKey=$($apiKey)"

echo (Invoke-WebRequest -Uri $uri).Content