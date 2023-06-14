# class ApisController < ApplicationController
#   def index
#     require 'uri'
#     require 'net/http'

#     url = URI("https://airbnb19.p.rapidapi.com/api/v1/searchDestination?query=Chicago&country=USA")

#     http = Net::HTTP.new(url.host, url.port)
#     http.use_ssl = true

#     request = Net::HTTP::Get.new(url)
#     request["X-RapidAPI-Key"] = 'c80c98bd93msh13e8bb770f390dbp1f2588jsndc2af0906f87'
#     request["X-RapidAPI-Host"] = 'airbnb19.p.rapidapi.com'

#     response = http.request(request)
#     render json: response.read_body
#   end
# end
