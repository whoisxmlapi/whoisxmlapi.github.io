try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

domain = 'example.com'
api_key = 'your whois api key'


url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'\
    + 'domainName=' + domain + '&apiKey=' + api_key

print(urlopen(url).read().decode('utf8'))