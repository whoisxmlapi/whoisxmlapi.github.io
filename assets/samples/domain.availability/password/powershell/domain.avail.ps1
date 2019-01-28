$domain = "example.com"
$password = "your domain availability api password"
$username = "your domain availability api username"

$uri = "https://www.whoisxmlapi.com/whoisserver/WhoisService?"`
     + "domainName=$($domain)&username=$($username)&password=$($password)"`
     + "&cmd=GET_DN_AVAILABILITY" + "&getMode=DNS_AND_WHOIS"

echo (Invoke-WebRequest -Uri $uri).Content