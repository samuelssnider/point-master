class Linker
	def initialize(user, reward)
		UserReward.create(user: user, reward: reward)
	end
end