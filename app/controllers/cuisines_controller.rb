class CuisinesController < ApplicationController
  def index
    cuisines = Cuisine.select(:id, :name).order('name')
    serializer = CuisineListSerializer.new(cuisines)
    render json: serializer
  end
end
