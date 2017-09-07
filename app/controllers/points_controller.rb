class PointsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@point = Point.new
	end
	
	def create
		@user = User.find(params[:user_id])
		@point = @user.points.new
		@point.save
		redirect_to users_path
	end
		
end