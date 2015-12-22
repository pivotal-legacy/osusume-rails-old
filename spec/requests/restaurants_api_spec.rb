require 'rails_helper'

describe 'Restaurants API' do
  def json_response
    JSON.parse(response.body)
  end

  describe 'get restaurants' do

    let!(:tsukemen) { Restaurant.create!(name: "Tukemen TETSU") }
    let!(:curry)    { Restaurant.create!(name: "Coco Curry") }

    it 'returns all restaurants' do
      get '/restaurants', format: :json
      expect(json_response.count).to eq 2
      expect(json_response[0]['name']).to eq "Tukemen TETSU"
      expect(json_response[1]['name']).to eq "Coco Curry"
    end
  end

  describe 'create restaurant' do
    let(:restaurant_json) { { restaurant: { name: 'Tonkatsu' } } }
    it 'creates the restaurant' do
      expect {
        post '/restaurants', restaurant_json, format: :json
      }.to change { Restaurant.count }.by(1)
    end

    it 'returns created restaurant' do
      post '/restaurants', restaurant_json, format: :json
      puts json_response
      expect(json_response['name']).to eq "Tonkatsu"
    end


  end
end