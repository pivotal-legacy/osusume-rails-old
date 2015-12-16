class RestaurantsController < ApplicationController
  def index
    @restaurants =[{name: 'first restaurant', id: 1}, {name: 'second restaurant', id: 2}]
    render json: @restaurants
  end
end