$uri = "https://www.whoisxmlapi.com/brand-alert-api/search.php?"`
+ "term1=cinema"`
+ "&username=Your_brand_alert_api_username"`
+ "&password=Your_brand_alert_api_password"`
+ "&rows=10"`
+ "&page=2"

$j = Invoke-WebRequest -Uri $uri
echo "JSON:`n---" $j.content "`n"