########################
# Fill in your details #
########################
$apiKey = "Your API key"

$domainName = "whoisxmlapi.com"

$uri = "https://www.whoisxmlapi.com/whoisserver/WhoisService?"`
    + "domainName=$domainName"`
    + "&apiKey=$apiKey"`
    + "&outputFormat=JSON"


#######################
# Use a JSON resource #
#######################

$j = Invoke-WebRequest -Uri $uri
echo "JSON:`n---" $j.content "`n"
