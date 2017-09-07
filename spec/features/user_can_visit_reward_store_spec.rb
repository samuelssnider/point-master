RSpec.describe "A user" do
	it "can visit the rewards store and view the rewards" do
		User.create(username: "sam", password: "snider")
		reward1 = Reward.new(title: "Ruby",
		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
		reward1 = Reward.new(title: "Emerald",
		url: "https://www.gempundit.com/skin/frontend/ultimo/default/img/bg/emerald-banner1.png")
		visit '/' 
		click_on "Login"
		expect(current_path).to eq('/login')
		fill_in "username", with: "sam"
		fill_in "password", with: "snider"
		click_on "Login"
		click_on "Rewards Store"
		save_and_open_page
		expect(page).to have_content("Ruby")
		expect(page).to have_content("Emerald")
		
	end
end