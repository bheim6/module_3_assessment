require 'rails_helper'

RSpec.feature "User can search for stores" do
  scenario "they enter a zip code on the root page" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in a search box with "80202" and click "search"
    fill_in "Zip", with: "80202"
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq('/search')
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")
    # And I should see exactly 15 results
    # within(".stores") do
    #   
    # end
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
  end
end
