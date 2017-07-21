class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		# create user with user info
		@user = User.find_or_initialize_by(login_params)
	
		if @user.persisted?
			session[:user_id] = @user.id
			redirect_to @user
		else	# new user so sign up
			if @user.save	
				session[:user_id] = @user.id
				redirect_to @user
			else
				render 'new'
			end
		end

	end

	def show
		if session[:user_id]
			@user = User.find(session[:user_id])
		else
			redirect_to 'logout'
		end
	end


	
	private
=begin
	def existing_user
		@users = User.all
		@users.each do |user|
			return true if user.email==@user.email
		end
		return false
	end

	def current_user 
		@current_user ||= User.find(session[:user_id])
	end
=end
	def login_params
		params.require(:user).permit(:email)
	end

end
