class GroupsController < ApplicationController
	
	def index
		if session[:user_id]
			@groups = Group.all
			@user = User.find(session[:user_id])
			#raise
		else
			redirect_to 'logout'
		end
	end

	def new
		@group = Group.new
		@user = User.find(session[:user_id])
	end

	def show
		if session[:user_id]
			@user = User.find(session[:user_id])
			@group = Group.find(params[:id])
			#raise
		else
			redirect_to 'logout'
		end
	end

	def create
		@user = User.find(session[:user_id])
		@group = @user.groups.create(group_params)
		if @group.save
			# update membership
			@membership = @group.memberships.first
			@membership.update_attributes(:admin => true)
			redirect_to @group
		else
			render @group
		end
	end

	private
	def group_params
		params.require(:group).permit(:name)
	end

end
