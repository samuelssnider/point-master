require 'rails_helper'

describe User do
  describe "validations" do
    it "is unredeemed by default" do
      user = User.create(username: "sam", password: "snider")  
      point = user.points.create
      expect(point.redeemed).to eq(false)
    end

    it "it can be created " do
      user = User.create(username: "sam", password: "snider")  
      point = user.points.create
      expect(point).to be_instance_of(Point)
    end

    describe "relationships" do
      it "belongs to a user" do
        user = User.create(username: "sam", password: "snider")
        point = user.points.create
        expect(point).to respond_to(:user)
      end
    end
  end
end