require 'rails_helper'

  # When I send a GET request to /api/v1/items I receive a 200 JSON response
  # containing all items And each item has an id, name, description, and image_url
  # but not the created_at or updated_at
  #
  # When I send a GET request to /api/v1/items/1 I receive a 200 JSON response
  # containing the id, name, description, and image_url but not the created_at
  # or updated_at
  #
  # When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response
  #  if the record is successfully deleted
  #
  # When I send a POST request to /api/v1/items with a name, description, and
  # image_url I receive a 201 JSON response if the record is successfully created
  # And I receive a JSON response containing the id, name, description, and image_url
  # but not the created_at or updated_at

describe "User can CRUD items from api" do
  it "can see all items" do
    5.times do
      Item.create(name: "thing", description: "cool", image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
    end

    get 'api/v1/items'

    expect(response.status).to eq(200)

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.first[:name]).to eq("thing")
    expect(items.first[:description]).to eq("cool")
    expect(items.first[:image_url]).to eq("https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")

    expect(items.count).to eq(5)
  end

  it "can see a single item" do
    Item.create(name: "thing", description: "cool", image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")

    get '/api/v1/items/1'

    expect(response.status).to eq(200)

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:name]).to eq("thing")
    expect(item[:description]).to eq("cool")
    expect(item[:image_url]).to eq("https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
    expect(item[:id]).to eq(1)
  end

  it "can create an item" do
    item_params = {name: "thing", description: "cool", image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png"}
    post '/api/v1/items', item_params

    item = Item.last

    expect(response.status).to eq(201)

    expect(item[:name]).to eq("thing")
    expect(item[:description]).to eq("cool")
    expect(item[:image_url]).to eq("https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")
  end

  it "can delete an item" do
    Item.create(name: "thing", description: "cool", image_url: "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png")

    delete '/api/v1/items/1'

    
  end
end
