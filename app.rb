require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
require 'news-api'
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     




get "/" do
  view "ask"
end

get "/news" do
        results = Geocoder.search(params["q"])
        lat_long = results.first.coordinates
        lat = lat_long[0]
        long = lat_long[1]
        

       # configure the Dark Sky API with your API key
        ForecastIO.api_key = "ec96baecc5eb294ba0c7a9e5f369f9df"

        forecast = ForecastIO.forecast(lat, long).to_hash
        #"#{forecast}"

#current_temp = forecast["currently"]["temperature"]
#current_cond = forecast["currently"]["summary"]
#for day in forecast["daily"]["data"]
#end

# Init
newsapi = News.new("2487f35b8e7047ecbbc6edfe3c104c31")             

# /v2/top-headlines
top_headlines = newsapi.get_top_headlines(q: 'bitcoin',
                                          sources: 'bbc-news,the-verge',
                                          category: 'business',
                                          language: 'en',
                                          country: 'us')
pp "#{top_headlines}"
                                          
    #view "news"

end


#url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=2487f35b8e7047ecbbc6edfe3c104c31"
#news = HTTParty.get(url).parsed_response.to_hash
# news is now a Hash you can pretty print (pp) and parse for your output
# Init
#newsapi = News.new("2487f35b8e7047ecbbc6edfe3c104c31")             

# /v2/top-headlines
#top_headlines = newsapi.get_top_headlines(q: 'bitcoin',
                                          #sources: 'bbc-news,the-verge',
                                          #category: 'business',
                                          #language: 'en',
                                          #country: 'us')