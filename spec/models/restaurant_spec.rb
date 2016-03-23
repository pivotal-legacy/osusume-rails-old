require 'rails_helper'

describe Restaurant do

  it 'should associate cuisine type with restaurant' do
    cuisine = Cuisine.create(id: 1, name: "Italian")
    restaurant = Restaurant.create(name: "Robertini!")
    restaurant.cuisine_id = cuisine.id

    expect(restaurant.cuisine).to eq(cuisine)
  end

  it 'returns restaurants liked by a user' do
    user = User.create(id: 1, name: "Uncle Bob")
    restaurant = Restaurant.create(name: "Robertini!")
    like = Like.create(user_id: 1, restaurant_id: restaurant.id)

    liked_restaurants = Restaurant.likes_for_user(user.id)

    expect(liked_restaurants.count).to be 1
    expect(liked_restaurants.first.name).to eq("Robertini!")
  end

end
