try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

domain = 'example.com'
apiKey = 'Your DNS Lookup API Key'
type = '_all'

url = 'https://www.whoisxmlapi.com/whoisserver/DNSService?'
    + 'apiKey=' + apiKey + '&domainName=' + domain + '&type=' + type

print(urlopen(url).read().decode('utf8'))
