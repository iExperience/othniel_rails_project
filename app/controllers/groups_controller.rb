class GroupsController < ApplicationController
	def new
		@group = Group.new
		@user = User.find(session[:user_id])
	end

	def show
		@group = Group.find(params[:id])
	end

	def create
		@user = User.find(session[:user_id])
		#render plain: params[:group].inspect
		@group = @user.groups.create(group_params)
		#@group.comments ||= nil
		if @group.save
			# update membership
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
