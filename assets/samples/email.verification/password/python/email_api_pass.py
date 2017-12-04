try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

emailAddress = 'support@whoisxmlapi.com';
password = 'your email verification api password'
username = 'your email verification api username'

url = 'http://www.whoisxmlapi.com/whoisserver/EmailVerifyService?'\
    + 'emailAddress=' + emailAddress + '&validateDNS=true&validateSMTP=true'\
    + '&checkCatchAll=true&checkFree=true&checkDisposable=true'\
    + '&username=' + username + '&password=' + password

print(urlopen(url).read().decode('utf8'))