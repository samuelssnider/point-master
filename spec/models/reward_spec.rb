require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe "validations" do
    describe "invalid attributes" do
      it "is invalid without a title" do
        reward = Reward.create(cost: 3,
    		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
        expect(reward).to be_invalid
      end
      
      it "is invalid without a url" do
        reward = Reward.create(title: "Ruby", cost: 3)
        expect(reward).to be_invalid
    	end
      
      it "is invalid without a unique title" do
        reward = Reward.create(title: "Ruby", cost: 3,
    		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
        reward2 = Reward.create(title: "Ruby", cost: 3,
    		url: "https://udemy-images.udemy.com/course/750x422/8pg")
        
        expect(reward2).to be_invalid
      end
      
      it "is invalid without a unique url" do
        reward = Reward.create(title: "Ruby", cost: 3,
    		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
        reward2 = Reward.create(title: "Emerald", cost: 3,
    		url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
        
        expect(reward2).to be_invalid
      end
    end
    describe "valid attributes" do
      it "is valid without cost" do
        reward = Reward.create(title: "Ruby",
        url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
        
        expect(reward).to be_valid
        expect(reward.cost).to eq(1)
      end
    end
    
    describe "valid attributes" do
      it "is valid with valid attrubutes" do
        reward = Reward.create(title: "Ruby", cost: 3,
        url: "https://udemy-images.udemy.com/course/750x422/8082_e627_11.jpg")
        
        expect(reward).to be_valid
        expect(reward.cost).to eq(3)
      end
    end
  end
  describe "relationships" do
    it "can belong to a user" do
      user = User.create(username: "sam", password: "snider")
      reward = user.rewards.create(title: "whatever", url: "what")
      expect(reward).to respond_to(:users)
    end
  end    
end
