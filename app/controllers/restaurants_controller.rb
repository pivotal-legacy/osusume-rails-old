class RestaurantsController < ApplicationController
  def index
    render json: Restaurant.order('created_at desc').to_json(include: {user: {only: :name}})
  end

  def create
    restaurant = Restaurant.new(restaurant_params.merge(user: current_user))

    if restaurant.save
      render json: restaurant.to_json(include: {user: {only: :name}})
    else
      render json: restaurant.errors, status: :unprocessable_entity
    end
  end

  def show
    restaurant = Restaurant.find(params[:id])
    user = {user: {only: :name}}
    comments = {comments: {include: user}}

    render json: restaurant.to_json(include: [user, comments])
  end

  def update
    restaurant = Restaurant.find(params[:id])

    if restaurant.update(restaurant_params)
      render json: restaurant
    else
      render json: restaurant.errors, status: :unprocessable_entity
    end

  end

  private

  def restaurant_params
    params.require(:restaurant)
        .permit(
            :name,
            :address,
            :cuisine_type,
            :offers_english_menu,
            :walk_ins_ok,
            :accepts_credit_cards,
            :notes,
            :photo_url
        )
  end
end
