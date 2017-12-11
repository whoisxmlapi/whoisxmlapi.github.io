try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

emailAddress = 'support@whoisxmlapi.com';
apiKey = 'Your email verification api API_KEY'

url = 'https://emailverification.whoisxmlapi.com/api/v1?'\
    + 'emailAddress=' + emailAddress + '&apiKey=' + apiKey

print(urlopen(url).read().decode('utf8'))