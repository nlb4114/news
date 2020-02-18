require 'open-uri'
url = 'http://newsapi.org/v2/top-headlines?'\
      'country=us&'\
      'apiKey=2487f35b8e7047ecbbc6edfe3c104c31'
req = open(url)
response_body = req.read
pp response_body