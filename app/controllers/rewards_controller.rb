class RewardsController < ApplicationController
	def index
		@rewards = Reward.all
	end
	
	def new
		@user = User.find(session[:user_id])
		@reward = @user.rewards.new
	end
	
	def create
		@user = User.find(session[:user_id])
		@reward = @user.rewards.new(reward_params)
		if @reward.save
			redirect_to user_path(@user)
		else
			render :new
		end
	end


	private
	def reward_params
		params.require(:reward).permit(:title, :url)
	end
end