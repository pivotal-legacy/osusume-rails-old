class RestaurantsController < ApplicationController
  def index
    render json: Restaurant.order('created_at desc')
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
