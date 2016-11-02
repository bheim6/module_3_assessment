class BestBuyService < ApplicationController
  def self.stores(params)
    key = ENV['api_key']
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{params["q"]},25))?format=json&show=storeId,storeType,longName,city,distance,phone,region&pageSize=15&apiKey=#{key}"
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.found_stores
  #   stores_array = self.stores(params)[:stores]
  #   stores_array.map do |raw_store|
  #     BestBuyStore.new(raw_store)
  #   end
  # end

end
