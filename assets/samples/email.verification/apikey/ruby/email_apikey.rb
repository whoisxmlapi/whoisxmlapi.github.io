require 'base64'
require 'openssl'
require 'open-uri'

email = 'support@whoisxmlapi.com'
key = 'your public email verification api key'
secret = 'your secret email verification api key'
username = 'your email verification api username'

time = (Time.now.to_f * 1000).to_i
req = Base64.encode64('{"t":' + time.to_s + ',"u":"' + username + '"}')
data = username + time.to_s + key
digest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::MD5.new, secret, data)

url = 'http://www.whoisxmlapi.com/whoisserver/EmailVerifyService?'\
    + 'requestObject=' + req + '&digest=' + digest + '&emailAddress=' + email\
    + '&checkCatchAll=1'

puts open(url).read