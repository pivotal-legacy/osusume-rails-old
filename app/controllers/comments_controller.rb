class CommentsController < ApplicationController

	def create
		comment = Comment.new(comment_params)

		if comment.save
			render json: comment.to_json
		else
			render json: comment.errors, status: :unprocessable_entity
		end
	end

	private

	def comment_params
    params.require(:comment).permit(:content, :restaurant_id)
	end

end
