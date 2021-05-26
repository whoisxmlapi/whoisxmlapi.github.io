#!/usr/bin/env python3

try:
    from urllib.request import Request, urlopen
except ImportError:
    from urllib2 import Request, urlopen
from json import dumps, loads
from time import sleep

# Your API key
apiKey = 'Your API key'

#Input: list of domains to be queried
domains = ['whoisxmlapi.com', 'threatintelligenceplatform.com']

# Base URL of the API
url = 'https://www.whoisxmlapi.com/BulkWhoisLookup/bulkServices/'
# Encoding of python strings. Should be the default 'utf-8' also for punicode domain names
enc = 'utf-8'
# Interval in seconds between two checks of whether the results are ready
interval = 5

#Making the requests with the domain names, getting the request ID
payload_data = {'domains': domains, 'apiKey': apiKey, 'outputFormat': 'JSON'}
request = Request(url + 'bulkWhois')
request_id = loads(urlopen(request, dumps(payload_data).encode(enc)).read())['requestId']

#Set the payload for the next phase
payload_data.update({'requestId':request_id, 'searchType':'all', 'maxRecords':1, 'startIndex':1})
del payload_data['domains']

n_domains = len(domains)
n_remaining = n_domains
request = Request(url + 'getRecords')

while n_remaining > 0:
    print("Waiting %d seconds"%interval)
    sleep(interval)
    response = loads(urlopen(request, dumps(payload_data).encode(enc)).read())
    n_remaining = response['recordsLeft']
    print("%d of %d domains to be processed"%(n_remaining, n_domains))
print("Done, downloading data")
#Get the data
payload_data.update({'maxRecords': n_domains})
result = loads(urlopen(request, dumps(payload_data).encode(enc)).read().decode(enc, 'ignore'))
print(result)
