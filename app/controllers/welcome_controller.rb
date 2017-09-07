class WelcomeController < ApplicationController

	def dashboard
		@users = User.all
	end

end
