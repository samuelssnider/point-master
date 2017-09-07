class User < ApplicationRecord
	has_secure_password
	validates :username, presence: true, uniqueness: true
	has_many  :points
	has_many 	:rewards

	def self.authenticate(username, password)
		user = find_by_username(username)
    if user && user.password == password
      user
    else
      nil
    end
	end
	
	def unredeemed_points
		points.count{|point| !point.redeemed}
	end
end