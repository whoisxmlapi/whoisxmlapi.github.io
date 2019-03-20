require 'uri'
require 'json'
require 'net/https'

key = "Your Brand Alert 2.0 API key"
mode = "preview"
terms = ["facebook"]

url = 'https://brand-alert-api.whoisxmlapi.com/api/v2'
data = {apiKey: key, mode: mode, includeSearchTerms: terms}
uri = URI.parse(url)
http, http.use_ssl = Net::HTTP.new(uri.host, uri.port), true
req, req.body = Net::HTTP::Post.new(uri.request_uri), data.to_json
http.request(req).body

puts http.request(req).body