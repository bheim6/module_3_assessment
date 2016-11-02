class BestBuyService < ApplicationController
  def self.stores(params)
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{params["q"]},25))?format=json&show=storeId,storeType,longName,city,distance,phone,region&pageSize=15&apiKey=nysued5unnmfhft4bp5u6779"
    JSON.parse(response.body, symbolize_names: true)
  end

  
end
