# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Results/index page', :vcr, type: :feature do
  describe 'top 20 rated movies search' do
    it 'displays the top 20 rated movies' do
      @user = create(:user)
      visit user_discover_path(@user)
      click_button 'Find Top Rated Movies'

      expect(page).to have_link('The Godfather')
      expect(page).to have_content('The Godfather, 8.7')
      expect(page).to have_selector('ul li', count: 20)
    end
  end

  describe 'keyword search movies' do
    it 'displays the keyword search results' do
      @user = create(:user)
      visit user_discover_path(@user)
      fill_in('keywords', with: 'Star Wars')
      click_button 'Find Movies'

      expect(page).to have_link('Star Wars')
      expect(page).to have_content('Star Wars, 8.204')
      expect(page).to have_content('Star Wars: The Force Awakens, 7.294')
    end
  end
end
