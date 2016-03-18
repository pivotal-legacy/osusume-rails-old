class LikesController < ApplicationController

  def create
    like = Like.new(
      user_id: current_user.id,
      restaurant_id: params[:restaurant_id]
    )

    if like.save
      render json: {}, status: :created
    else
      head :unprocessable_entity
    end
  end

end
