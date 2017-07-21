class MembershipsController < ApplicationController

	def create
		@membership = Membership.create(user_id: session[:user_id], group_id: session[:false_id], admin: false)
		@membership.save
		redirect 'groups'
	end

end
