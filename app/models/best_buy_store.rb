class BestBuyStore
  def initialize(attrs)
    @attrs = attrs
  end

  def name
    attrs[:longName]
  end

  def city
    attrs[:city]
  end

  def distance
    attrs[:distance]
  end

  def phone
    attrs[:phone]
  end

  def store_type
    attrs[:storeType]
  end

  private
    attr_reader :attrs
end
