class WelcomeController < ApplicationController

	def dashboard
		@users = User.all
		@user = User.find(session[:user_id]) if session[:user_id]
	end

end
