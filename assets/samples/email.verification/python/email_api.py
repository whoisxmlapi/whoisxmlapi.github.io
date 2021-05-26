try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

email = 'support@whoisxmlapi.com'
api_key = 'your_api_key'
api_url = 'https://emailverification.whoisxmlapi.com/api/v1?'

url = api_url + 'apiKey=' + api_key + '&emailAddress=' + email

print(urlopen(url).read().decode('utf8'))
