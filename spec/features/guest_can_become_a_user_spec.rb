require 'rails_helper'
RSpec.describe "guest becomes a user" do
	it "guest creates a new user" do
			visit '/'

			click_on "Create New User"
			fill_in "user[username]", with: "sam"
			fill_in "user[password]", with: "snider"
			click_on "Create User"
			expect(current_path).to eq("/users/#{User.last.id}")
			expect(page).to have_content("Hello sam!")
	end
	it "guest logs in as an existing user and can log out" do
		visit root_url
		User.create(username: "sam", password: "snider")
		click_on "Login"
		expect(current_path).to eq('/login')
		fill_in "username", with: "sam"
		fill_in "password", with: "snider"
		click_on "Login"
		expect(page).to have_content("Hello sam")
		expect(page).to have_content("0 Points")
		click_on "Dashboard"
		click_on "Logout"
		
		expect(page).to have_content("Create New User")
		expect(page).to have_content("Login")
	end
end
