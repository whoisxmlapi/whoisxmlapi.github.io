$domain = "example.com"
$key = "your domain availability api key"
$secret = "your domain availability api secret key"
$username = "your domain availability api username"

$time = [DateTimeOffset]::Now.ToUnixTimeMilliseconds()
$req=[Text.Encoding]::UTF8.GetBytes("{`"t`":$($time),`"u`":`"$($username)`"}")
$req = [Convert]::ToBase64String($req)

$data = $username + $time + $key
$hmac = New-Object System.Security.Cryptography.HMACMD5
$hmac.key = [Text.Encoding]::UTF8.GetBytes($secret)
$hash = $hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($data))
$digest = [BitConverter]::ToString($hash).Replace('-','').ToLower()

$uri = "https://www.whoisxmlapi.com/whoisserver/WhoisService?"`
     + "requestObject=$($req)&digest=$($digest)&domainName=$($domain)"`
     + "&cmd=GET_DN_AVAILABILITY"

echo (Invoke-WebRequest -Uri $uri).Content