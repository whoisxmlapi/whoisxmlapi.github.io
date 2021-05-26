try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

domainName = 'whoisxmlapi.com';
apiKey = 'Your API key'

url = 'https://www.whoisxmlapi.com/whoisserver/WhoisService?'\
    + 'domainName=' + domainName + '&apiKey=' + apiKey + "&outputFormat=JSON"

print(urlopen(url).read().decode('utf8'))
