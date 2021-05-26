require 'open-uri'

domain = 'example.com'
apiKey = 'Your DNS Lookup API Key'
type = '_all'

url = 'https://www.whoisxmlapi.com/whoisserver/DNSService?'
    + 'apiKey=' + apiKey + '&domainName=' + domain +  '&type=' + type

puts open(url).read
