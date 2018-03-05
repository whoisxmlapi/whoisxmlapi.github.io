require 'open-uri'

domain = 'example.com'
api_key = 'your whois api key'

url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'\
    + 'domainName=' + domain + '&apiKey=' + api_key

puts open(url).read