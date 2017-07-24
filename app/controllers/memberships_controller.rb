class MembershipsController < ApplicationController

	def create
	end


	# create membership when user join existing group
	def new
		raise
		@membership = Membership.create(user_id: session[:user_id], group_id: session[:false_id], admin: false)
		@membership.save
		raise
		#redirect_to 'groups'
	end

end
