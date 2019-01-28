require 'base64'
require 'openssl'
require 'open-uri'

domain = 'example.com'
key = 'your domain availability api key'
secret = 'your domain availability api secret key'
username = 'your domain availability api username'

time = (Time.now.to_f * 1000).to_i
req = Base64.encode64('{"t":' + time.to_s + ',"u":"' + username + '"}')
data = username + time.to_s + key
digest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::MD5.new, secret, data)

url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?'\
    + 'requestObject=' + req + '&digest=' + digest + '&domainName=' + domain\
    + '&cmd=GET_DN_AVAILABILITY' + '&getMode=DNS_AND_WHOIS'

puts open(url).read