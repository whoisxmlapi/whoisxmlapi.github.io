require 'open-uri'
require 'json'
require 'rexml/document'
require 'rexml/xpath'
require 'yaml'		# only needed to print the returned result in a very pretty way

########################
# Fill in your details #
########################
apiKey = "Your API key"

domainName = "whoisxmlapi.com"

url = 'https://www.whoisxmlapi.com/whoisserver/WhoisService?' +
    'apiKey=' + apiKey +
    '&domainName=' + domainName

format = "JSON"
# Open the resource
buffer = open(url + '&outputFormat=' + format).read

# Parse the JSON result
result = JSON.parse(buffer)

# Print out a nice informative string
puts "JSON:\n" + result.to_yaml + "\n"
