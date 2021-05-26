$domain = "example.com"
$apiKey = "Your Domain Availability API Key"

$uri = "https://domain-availability.whoisxmlapi.com/api/v1?"
     + "apiKey=$($apiKey)&domainName=$($domain)"`

echo (Invoke-WebRequest -Uri $uri).Content
