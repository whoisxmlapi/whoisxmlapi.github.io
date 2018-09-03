try:
    from urllib.request import Request, urlopen
except ImportError:
    from urllib2 import Request, urlopen
from json import dumps, loads
from time import sleep

url = 'https://www.whoisxmlapi.com/BulkWhoisLookup/bulkServices/'
(dom, enc) = ['whoisxmlapi.com', 'threatintelligenceplatform.com'], 'utf-8'
(login, passw, fm, interval) = 'Bulk whois api login', 'password', 'json', 5

d = {'domains': dom, 'password': passw, 'username': login, 'outputFormat': fm}
req = Request(url + 'bulkWhois')
ri = loads(urlopen(req, dumps(d).encode(enc)).read())['requestId']
d.update({'requestId':ri, 'searchType':'all', 'maxRecords':1, 'startIndex':1})
(recs, req, d) = len(dom), Request(url + 'getRecords'), d.pop('domains')

while recs > 0:
    sleep(interval)
    recs = loads(urlopen(req, dumps(d).encode(enc)).read())['recordsLeft']
d.update({'maxRecords': len(dom)})
print(urlopen(req, dumps(d).encode(enc)).read())