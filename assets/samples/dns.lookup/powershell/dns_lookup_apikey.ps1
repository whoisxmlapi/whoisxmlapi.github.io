$domain = "example.com"
$apiKey = "Your DNS Lookup API Key"
$type = "_all"

$uri = "https://www.whoisxmlapi.com/whoisserver/DNSService?"
     + "apiKey=$($apiKey)&domainName=$($domain)&type=$($type)"

echo (Invoke-WebRequest -Uri $uri).Content
