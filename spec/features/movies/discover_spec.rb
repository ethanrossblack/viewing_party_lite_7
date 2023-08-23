require 'rails_helper'

describe "Discover Movies Page" do
  before do
    @user = create(:user)
    visit user_discover_path(@user)
  end

  it "has a button to discover top rated movies" do
    save_and_open_page
    expect(page).to have_button("Find Top Rated Movies").once

    click_button("Find Top Rated Movies")

    expect(current_path).to eq("/users/#{@user.id}/movies?q=top%20rated")
  end

  xit "has a field to enter keywords to search by movie title" do

  end

  xit "has a button to search by movie title" do

  end
end



# I should see
# Button to Discover Top Rated Movies
# A text field to enter keyword(s) to search by movie title
# A Button to Search by Movie Title