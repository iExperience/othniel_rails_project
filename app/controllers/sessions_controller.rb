class SessionsController < ApplicationController

	def new
		@user = User.new
	end


	def destroy
		session[:user_id] = nil
		@user = User.new
		render 'new'
	end

end
