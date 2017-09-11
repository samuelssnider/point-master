class User < ApplicationRecord
	has_secure_password
	validates :username, presence: true, uniqueness: true
	has_many  :points
	has_many  :user_rewards
	has_many 	:rewards, through: :user_rewards

	def self.authenticate(username, password)
		user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
	end
	
	def point_subtract(number)
		number.times do |point, index|
			unredeemed_points[index].redeemed = true
		end
	end
		
	
	def unredeemed_points
		points.count{|point| !point.redeemed}
	end
end