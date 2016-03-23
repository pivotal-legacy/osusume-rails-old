class CuisinesController < ApplicationController
  def index
    cuisines = Cuisine.select(:id, :name).order('name')
    serializer = CuisineListSerializer.new(cuisines)
    render json: serializer
  end

  def create
    render json: Cuisine.create(name: params["name"]),
           status: :created
  end
end
