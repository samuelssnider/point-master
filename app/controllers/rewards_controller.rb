class RewardsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@rewards = Reward.all
	end
	
	def show
		@reward = Reward.find(params[:id])
	end
	
	def new
		@reward = Reward.new
	end
	
	def create
		@reward = Reward.new(reward_params)
		if @reward.save
			redirect_to user_path(@user)
		else
			render :new
		end
	end
	
	def update
		@reward = Reward.find(params[:id])
		if current_user.unredeemed_points >= @reward.cost
			Linker.new(current_user, @reward)
			flash[:success] = "You added #{@reward.title} to your rewards"
			# current_user.point_subtract(@reward.cost)
		else
			flash[:failure] = "You don't have enough points to add #{@reward.title}"
			redirect_to rewards_path
		end
	end

	private
	def reward_params
		params.require(:reward).permit(:title, :url, :cost)
	end
end