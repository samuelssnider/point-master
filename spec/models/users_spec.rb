describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new(password: "snider")
        expect(user).to be_invalid
      end
			
			it "is invalid without a password" do
        user = User.new(username: "sam")
        expect(user).to be_invalid
      end

      it "has a unique username" do
        User.create(username: "sam", password: "snider")
        user = User.new(username: "sam", password: "snider")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        user = User.new(username: "sam", password: "snider")
        expect(user).to be_valid
      end
    end
  end

  # describe "relationships" do
  #   it "has many points" do
  #     user = User.new(username: "Dropbox")
  #     expect(user).to respond_to(:jobs)
  #   end
  # end
end