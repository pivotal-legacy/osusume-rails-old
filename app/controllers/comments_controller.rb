class CommentsController < ApplicationController

	def create
		comment = Comment.new(comment_params.merge(user: current_user))

		if comment.save
			user = {user: {only: :name}}
			render json: comment.to_json(include: [user]), status: :created
		else
			render json: comment.errors, status: :unprocessable_entity
		end
	end

	private

	def comment_params
    params.require(:comment).permit(:content).merge(params.slice(:restaurant_id))
	end

end
