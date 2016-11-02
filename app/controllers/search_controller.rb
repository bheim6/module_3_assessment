class SearchController < ApplicationController
  def index
    response = Faraday.get 'https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,longName,city,distance,phone,region&pageSize=15&apiKey=nysued5unnmfhft4bp5u6779'
    @stores = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
