class ProfileController < ApplicationController
  def posts
    restaurants = Restaurant.order('created_at desc')
                      .includes(:user, :photo_urls)
                      .where(user: current_user)
    serializer = RestaurantListSerializer.new(restaurants)
    render json: serializer
  end

  def likes
    restaurants = Restaurant.joins(:likes)
                      .where("likes.user_id = ?", current_user.id)
    serializer = RestaurantListSerializer.new(restaurants)
    render json: serializer
  end

  def show
    render json: UserSerializer.new(current_user)
  end
end
