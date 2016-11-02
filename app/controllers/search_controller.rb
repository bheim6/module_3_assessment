class SearchController < ApplicationController
  def index
    @stores = BestBuyService.stores(params)
    
    @total_count = @stores[:total]

    @stores_array = @stores[:stores]

    @found_stores = @stores_array.map do |raw_store|
      BestBuyStore.new(raw_store)
    end
    # binding.pry
  end
end
