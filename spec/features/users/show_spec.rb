# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The user dashboard' do
  before do
    @user = create(:user)
    visit user_path(@user)
  end

  it 'Displys the user name title' do
    within('#page-title') do
      expect(page).to have_content("#{@user.name}'s Dashboard")
    end
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')
    expect(current_path).to eq(user_discover_path(@user))
  end

  it 'has a section that lists viewing parties' do
    within('#viewing-parties') do
      expect(page).to have_content('Viewing Parties')
    end
  end
end
