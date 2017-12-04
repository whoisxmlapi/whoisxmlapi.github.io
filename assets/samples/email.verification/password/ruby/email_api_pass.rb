require 'open-uri'

email = 'support@whoisxmlapi.com'
password = 'your email verification api password'
username = 'your email verification api username'

url = 'http://www.whoisxmlapi.com/whoisserver/EmailVerifyService?'\
    + 'emailAddress=' + email + '&username=' +username + '&password=' +password\
    + '&validateDNS=true&validateSMTP=true&checkFree=true&checkCatchAll=true'\
    + '&checkDisposable=true&outputFormat=json'

puts open(url).read