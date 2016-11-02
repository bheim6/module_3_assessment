require 'rails_helper'

RSpec.feature "User can search for stores" do
  scenario "they enter a zip code on the root page" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in a search box with "80202" and click "search"
    fill_in "Search for:", with: "80202"
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq('/search')
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")
    # And I should see exactly 15 results
    expect(page).to have_css(".stores li", count: 15)
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    within(".stores") do
      within("li:nth-child(1)") do
        expect(page).to have_content("Name: Best Buy Mobile - Cherry Creek Shopping Center")
        expect(page).to have_content("City: Denver")
        expect(page).to have_content("Distance: 3.25")
        expect(page).to have_content("Phone Number: 303-270-9189")
        expect(page).to have_content("Store Type: Mobile")
      end
    end
  end
end
