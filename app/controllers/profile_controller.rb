class ProfileController < ApplicationController
  def index
    restaurants = Restaurant.order('created_at desc')
                      .includes(:user, :photo_urls)
                      .where(user: current_user)
    serializer = RestaurantListSerializer.new(restaurants)
    render json: serializer
  end

  def show
    render json: UserSerializer.new(current_user)
  end
end
