class RewardsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@rewards = Reward.all
	end
	
	def new
		@reward = Reward.new
	end
	
	def update
		@reward = Reward.find(params[:id])
		Linker.new(current_user, @reward)
	end
	
	def create
		@reward = Reward.new(reward_params)
		if @reward.save
			redirect_to user_path(@user)
		else
			render :new
		end
	end


	private
	def reward_params
		params.require(:reward).permit(:title, :url, :cost)
	end
end