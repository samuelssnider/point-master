require 'rails_helper'

RSpec.describe "guest can login as an administrator" do
	it "administrator can create a point" do
		admin = User.create(username:"sam", password: "snider", admin: true)
		visit "/"
		click_on "Login"
		fill_in "username", with: "sam"
		fill_in "password", with: "snider"
		click_on "Login"
		visit "/"
		click_on "View users/Assign a new point"
		save_and_open_page
		click_on "Assign Point"
		expect(page).to have_content("Points: 1")
		expect(current_path).to eq("/users/#{admin.id}")
	end
end