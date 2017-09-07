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
		click_on "Add Point"
		expect(page).to have_content("sam")
		expect(page).to have_content("Points: 1")
		expect(admin.points.count).to eq(1)
		click_on "Add Point"
		click_on "Add Point"
		expect(admin.points.count).to eq(3)
		expect(admin.points.first.redeemed).to eq(false)
		expect(current_path).to eq("/users")
	end
end