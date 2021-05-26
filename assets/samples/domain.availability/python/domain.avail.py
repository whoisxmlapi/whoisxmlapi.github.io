try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

domain = 'example.com'
apiKey = 'Your Domain Availability API Key'

url = 'https://domain-availability.whoisxmlapi.com/api/v1?'
    + 'apiKey=' + apiKey + '&domainName=' + domain

print(urlopen(url).read().decode('utf8'))
