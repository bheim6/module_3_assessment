class SearchController < ApplicationController
  def index
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{params["q"]},25))?format=json&show=storeId,storeType,longName,city,distance,phone,region&pageSize=15&apiKey=nysued5unnmfhft4bp5u6779"
    @stores = JSON.parse(response.body, symbolize_names: true)

    @total_count = @stores[:total]

    @stores_array = @stores[:stores]

    @found_stores = @stores_array.map do |raw_store|
      BestBuyStore.new(raw_store)
    end
    binding.pry
  end
end
