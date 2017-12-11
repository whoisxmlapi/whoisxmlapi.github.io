require 'open-uri'

email = 'support@whoisxmlapi.com'
api_key = 'Your email verification api API_KEY'

url = 'https://emailverification.whoisxmlapi.com/api/v1?'\
    + 'emailAddress=' + email + '&apiKey=' + api_key

puts open(url).read