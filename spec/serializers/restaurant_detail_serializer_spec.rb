require 'rails_helper'

describe RestaurantDetailSerializer do
  it "serializes a current user's liked restaurant" do
    restaurant = Restaurant.new(likes: [Like.new(user_id: 678)], user: User.new(name: "hi"))

    json = RestaurantDetailSerializer.new(restaurant, 678).as_json

    expect(json["liked"]).to eq true
  end

  it "serializes a restaurant when the current user has not liked it" do
    restaurant = Restaurant.new(likes: [Like.new(user_id: 999)], user: User.new(name: "hi"))

    json = RestaurantDetailSerializer.new(restaurant, 678).as_json

    expect(json["liked"]).to eq false
  end
end
