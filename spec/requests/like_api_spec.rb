require "rails_helper"

describe "Likes API" do
  describe "POST /restaurants/:id/likes" do
    it "likes a restaurant for the current user" do
      user = User.create!(name: 'Hachiko', password: 'password')
      token = TokenEncoder.new(user).token
      restaurant = Restaurant.create!

      post "/restaurants/#{restaurant.id}/likes", {}, {authorization: "Bearer #{token}"}

      expect(response.status).to eq 201
      expect(Like.count).to eq 1
      first_like = Like.first

      expect(first_like.user_id).to eq user.id
      expect(first_like.restaurant_id).to eq restaurant.id
    end

    it "renders a 422 status if the like already exists" do
      user = User.create!(name: 'Hachiko', password: 'password')
      token = TokenEncoder.new(user).token
      restaurant = Restaurant.create!
      Like.create(user_id: user.id, restaurant_id: restaurant.id)

      post "/restaurants/#{restaurant.id}/likes", {}, {authorization: "Bearer #{token}"}

      expect(response.status).to eq 422
    end
  end
end
