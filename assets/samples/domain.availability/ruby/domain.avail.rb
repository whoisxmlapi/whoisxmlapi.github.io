require 'open-uri'

domain = 'example.com'
apiKey = 'Your Domain Availability API Key'

url = 'https://domain-availability.whoisxmlapi.com/api/v1?'
    + 'apiKey=' + apiKey + '&domainName=' + domain

puts open(url).read
