try:
    from urllib.request import urlopen, Request
except ImportError:
    from urllib2 import urlopen, Request

from json import dumps

terms = ['facebook'];
key = 'Your Brand Alert 2.0 API key'
mode = 'preview'

data = {'includeSearchTerms': terms, 'apiKey': key, 'mode': mode}
url = 'https://brand-alert-api.whoisxmlapi.com/api/v2'

req = Request(url)

print(urlopen(req, dumps(data).encode('utf-8')).read().decode('utf8'))