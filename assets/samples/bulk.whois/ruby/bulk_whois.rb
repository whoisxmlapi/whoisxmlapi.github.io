require 'json'
require 'net/https'
require 'uri'

csv_filename, domains = 'whois_records.csv', %w[google.com whoisxmlapi.com]

def api(path, data)
  url = 'https://www.whoisxmlapi.com/BulkWhoisLookup/bulkServices'
  b ={ apiKey:'Bulk Whois API Key', outputFormat:'json' }
  uri = URI.parse(url + path)
  http, http.use_ssl = Net::HTTP.new(uri.host, uri.port), true
  req, req.body = Net::HTTP::Post.new(uri.request_uri), b.merge(data).to_json
  http.request(req).body
end
# This will save whois record info for all domains as #{csv_filename}
id = JSON.parse(api('/bulkWhois', domains: domains))['requestId']
data = { requestId: id, startIndex: domains.count + 1, maxRecords: 0 }
loop do
  break if JSON.parse(api('/getRecords', data))['recordsLeft'].zero?
  sleep 3
end
File.write(csv_filename, api('/download', requestId: id, startIndex: 1))
