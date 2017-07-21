class CommentsController < ApplicationController

	def new
		@comment = Comment.new
		@user = User.find(session[:user_id])
		@group = Group.find(params[:group_id])
	end

	def create
		@group = Group.find(params[:group_id])
		@comment = @group.comments.create(comment_params)
		@comment[:user_id] = session[:user_id]
		# save any comment
		@comment.save
		redirect_to @group
	end

	# def destroy

	private

	def comment_params
		params.require(:comment).permit(:message)
	end
end
