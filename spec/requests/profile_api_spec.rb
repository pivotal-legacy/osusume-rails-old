require 'rails_helper'

describe 'Profile API' do
  let!(:user) { User.create!(name: 'Hachiko', password: 'password') }
  let!(:token) { TokenEncoder.new(user).token }

  describe 'GET /profile/' do
    it "returns current user profile" do
      get "/profile", {}, {format: :json, authorization: "Bearer #{token}"}
      expect(json_response.keys).to match_array(["name"])
      expect(json_response['name']).to eq "Hachiko"
    end
  end

  describe 'GET /profile/posts' do
    it "returns restaurants posted by the current user" do
      someone_else = User.create!(name: 'Taro', password: 'password')
      Restaurant.create!(name: "Afuri", created_at: 1.days.ago, user: someone_else)
      restaurant = Restaurant.create!(name: "Tsukemen TETSU", created_at: 2.days.ago, user: user)
      PhotoUrl.create!(url: "my-awesome-url", restaurant: restaurant)

      get "/profile/posts", {}, {format: :json, authorization: "Bearer #{token}"}

      expect(json_response.count).to eq 1
      expect(json_response.first.keys).to match_array(["id",
                                                       "name",
                                                       "accepts_credit_cards",
                                                       "address",
                                                       "created_at",
                                                       "cuisine",
                                                       "cuisine_type",
                                                       "notes",
                                                       "offers_english_menu",
                                                       "user",
                                                       "walk_ins_ok",
                                                       "photo_urls"])
      expect(json_response[0]['user'].keys).to match_array(["name"])
      expect(json_response[0]['name']).to eq "Tsukemen TETSU"
      expect(json_response[0]['user']['name']).to eq "Hachiko"
      expect(json_response[0]['photo_urls'][0]["url"]).to eq "my-awesome-url"
      expect(json_response[0]['created_at']).to eq restaurant.created_at.to_i
    end
  end

  describe 'GET /profile/likes' do
    it "returns liked restraurants by the current user" do
      someone_else = User.create!(name: 'Taro', password: 'password')
      restaurant_afuri = Restaurant.create!(name: "Afuri", created_at: 1.days.ago, user: someone_else)
      Restaurant.create!(name: "Tsukemen TETSU", created_at: 2.days.ago, user: someone_else)
      PhotoUrl.create!(url: "my-awesome-url", restaurant: restaurant_afuri)
      Like.create!(restaurant_id: restaurant_afuri.id, user_id: user.id)

      get "/profile/likes", {}, {format: :json, authorization: "Bearer #{token}"}

      expect(json_response.count).to eq(1)
      expect(json_response.first.keys).to match_array(["id",
                                                       "name",
                                                       "accepts_credit_cards",
                                                       "address",
                                                       "created_at",
                                                       "cuisine",
                                                       "cuisine_type",
                                                       "notes",
                                                       "offers_english_menu",
                                                       "user",
                                                       "walk_ins_ok",
                                                       "photo_urls"])
      expect(json_response[0]['user'].keys).to match_array(["name"])
      expect(json_response[0]['name']).to eq "Afuri"
      expect(json_response[0]['user']['name']).to eq "Taro"
      expect(json_response[0]['photo_urls'][0]["url"]).to eq "my-awesome-url"
      expect(json_response[0]['created_at']).to eq restaurant_afuri.created_at.to_i
    end
  end
end
