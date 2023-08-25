require 'rails_helper'

RSpec.describe "User Registration Page", type: :feature do
  before do
    visit register_path
  end

  describe "form details" do
    it "has name and email fields" do
      within("#registration-form") do
        expect(page).to have_field("Name")
        expect(page).to have_field("Email")
      end
    end

    it "has a registration button" do
      within("#registration-form") do
        expect(page).to have_button("Create New User")
      end
    end
  end
  
  describe "happy path" do
    it "can create a new user" do
      within("#registration-form") do
        fill_in("Name", with: "Ethan")
        fill_in("Email", with: "ethan@turing.edu")
        click_button("Create New User")
      end
      
      user = User.last
      
      # Flash message
      expect(page).to have_content("User successfully created")
      expect(current_path).to eq(user_path(user.id))
    end
  end

  describe "sad path" do
    it "returns an error if name and/or email are missing" do
      # Name and email are left blank
      within("#registration-form") do
        click_button("Create New User")
      end
      
      expect(page).to have_content("Error: Name can't be blank, Email can't be blank")
      expect(current_path).to eq(register_path)
      
      # Name is left blank
      within("#registration-form") do
        fill_in("Email", with: "ethan@turing.edu")
        click_button("Create New User")
      end
      
      expect(page).to have_content("Error: Name can't be blank")
      expect(current_path).to eq(register_path)

      # Email is left blank
      within("#registration-form") do
        fill_in("Name", with: "Ethan")
        click_button("Create New User")
      end
      
      expect(page).to have_content("Error: Email can't be blank")
      expect(current_path).to eq(register_path)
    end

    it "returns an error if the email is not a proper email" do
      not_email = "definitely NOT a valid email address"
      
      within("#registration-form") do
        fill_in("Name", with: "Ethan")
        fill_in("Email", with: not_email)
        click_button("Create New User")
      end

      expect(page).to have_content("Error: Email '#{not_email}' is not a valid email")
      expect(current_path).to eq(register_path)
    end

    it "returns an error if an email is not unique" do
      used_email = User.create(name: "Original Ethan", email: "ethan@turing.edu" )
      
      within("#registration-form") do
        fill_in("Name", with: "Clone Ethan")
        fill_in("Email", with: "ethan@turing.edu")
        click_button("Create New User")
      end
      
      expect(page).to have_content("Error: Email has already been taken")
      expect(current_path).to eq(register_path)
    end
  end
end