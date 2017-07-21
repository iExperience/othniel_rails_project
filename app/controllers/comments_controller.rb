class CommentsController < ApplicationController

	def new
		@comment = Comment.new
		@user = User.find(session[:user_id])
		@group = Group.find(param[:group_id])
	end

	def create
		@group = Group.find(param[:group_id])
		@comment = @group.comments.create(comment_params)

		# save any comment
		@comment.save
		redirect_to @group
	end

	# def destroy

	private

	def comment_params
		# comment = user_email + comment_text
		params.require(:comment).permit(:text)
		params[:name] = User.find_by(id: session[:user_id])[:email]
	end
end
