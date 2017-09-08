RSpec.describe "A user" do
	it "can visit the rewards store and view the rewards" do
		user =User.create(username: "sam", password: "snider")
		reward1 = Reward.create(title: "Ruby", cost: 3,
		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
		reward2 = Reward.create(title: "Emerald", cost: 2,
		url: "https://www.gempundit.com/skin/frontend/ultimo/default/img/bg/emerald-banner1.png")
		visit '/' 
		click_on "Login"
		expect(current_path).to eq('/login')
		fill_in "username", with: "sam"
		fill_in "password", with: "snider"
		click_on "Login"
		click_on "Rewards Store"
		expect(page).to have_content("Ruby")
		expect(page).to have_content("Emerald")
	end
	it "can purchase rewards from the store using points" do
		admin = User.create(username: "sam", password: "snider", admin: true)
		reward1 = Reward.create(title: "Ruby", cost: 3,
		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
		reward2 = Reward.create(title: "Emerald", cost: 2,
		url: "https://www.gempundit.com/skin/frontend/ultimo/default/img/bg/emerald-banner1.png")
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
		
		visit rewards_path
		save_and_open_page
		
	end
end