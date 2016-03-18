require 'rails_helper'

describe Restaurant do

  it 'should associate cuisine type with restaurant' do
    cuisine = Cuisine.create(id: 1, name: "Italian")
    restaurant = Restaurant.create(name: "Robertini!")
    restaurant.cuisine_id = cuisine.id

    expect(restaurant.cuisine).to eq(cuisine)
  end
end
