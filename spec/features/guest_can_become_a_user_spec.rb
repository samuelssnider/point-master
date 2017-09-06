require 'rails_helper'
RSpec.describe "guest becomes a user" do
	it "guest creates a new user" do
			visit '/'

			click_on "Create New User"
			fill_in "user[username]", with: "sam"
			fill_in "user[password]", with: "snider"
			click_on "Create User"
			expect(current_path).to eq("/users/#{User.last.id}")
			expect(page).to have_content("Hi sam")
	end
	it "guest logs in as an existing user" do
		click_on "Log In"

		expect(current_path).to eq('/log_in')
		fill_in "username", with: "sam"
		fill_in "password", with: "snider"

		click_on "Log in"

		expect(page).to have_content("Hi sam")
	end
end
