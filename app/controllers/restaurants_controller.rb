class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.order('created_at desc').includes(:user, :photo_urls)
    serializer = RestaurantListSerializer.new(restaurants)

    render json: serializer
  end

  KEY_MAP = {"photo_urls" => "photo_urls_attributes"}

  def create
    new_restaurant_attrs = restaurant_params
                               .merge(user: current_user)
                               .transform_keys { |key| KEY_MAP[key] || key }

    restaurant = Restaurant.new(new_restaurant_attrs)

    if restaurant.save
      render json: restaurant.to_json
    else
      render json: restaurant.errors, status: :unprocessable_entity
    end
  end

  def show
    restaurant = Restaurant.includes(:user, :photo_urls, :comments).find(params[:id])
    serializer = RestaurantDetailSerializer.new(restaurant)

    render json: serializer
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
            photo_urls: [:url]
        )
  end
end
