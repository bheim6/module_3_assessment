require 'rails_helper'

describe "User can CRUD items from api" do
  it "can see all items" do
    5.times do
      Item.create()
    end
    get 'api/v1/items'

    expect(response.status).to eq(200)

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(5)
  end
end
