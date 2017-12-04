require 'base64'
require 'openssl'
require 'open-uri'

domain = 'test.com'
key = 'your public dns lookup api key'
secret = 'your secret dns lookup api key'
username = 'your dns lookup api username'

time = (Time.now.to_f * 1000).to_i
req = Base64.encode64('{"t":' + time.to_s + ',"u":"' + username + '"}')
data = username + time.to_s + key
digest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::MD5.new, secret, data)

url = 'http://www.whoisxmlapi.com/whoisserver/DNSService?'\
    + 'requestObject=' + req + '&digest=' + digest + '&domainName=' + domain\
    + '&type=_all'

puts open(url).read