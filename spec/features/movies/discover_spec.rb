require 'rails_helper'

describe "Discover Movies Page" do
  before do
    @user = create(:user)
    visit user_discover_path(@user)
  end

  it "has a button to discover top rated movies" do
    VCR.use_cassette("top_20_rated_movies") do
      expect(page).to have_button("Find Top Rated Movies")
      click_button("Find Top Rated Movies")

      expect(current_path).to eq(user_movies_path(@user))
    end
  end

  it "has a search field to enter keyword(s) to search by movie title" do
    VCR.use_cassette("star_wars_search_results") do
      within("#keyword-search") do
        expect(page).to have_field("q")
        expect(page).to have_button("Find Movies")

        fill_in("q", with: "Star Wars")
        click_button("Find Movies")
      end
      
      expect(current_path).to eq(user_movies_path(@user))
    end
  end

  it "has a link to the root page" do
    expect(page).to have_link('Home', href: root_path)
  end
end