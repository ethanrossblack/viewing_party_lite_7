require 'rails_helper'

RSpec.describe "The users discover page" do
  before do
    @user = create(:user)
    visit user_discover_path(@user)
  end

  it "has a button to discover top rated movies" do
    expect(page).to have_button("Find Top Rated Movies")
    click_button("Find Top Rated Movies")
    save_and_open_page
    expect(current_path).to eq(results_path)
  end

  it "has a text field to enter keyword(s) to search by movie title" do
    expect(page).to have_field("Keywords")
    expect(page).to have_button("Find Movies")
  end

  it "has a link to the root page" do
    expect(page).to have_link('Home', href: root_path)
  end
end