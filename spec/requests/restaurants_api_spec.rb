require 'rails_helper'

describe 'Restaurants API' do
  def json_response
    JSON.parse(response.body)
  end

  describe 'get restaurants' do
    let!(:tsukemen) { Restaurant.create!(name: "Tukemen TETSU", created_at: 2.days.ago) }
    let!(:curry)    { Restaurant.create!(name: "Coco Curry", created_at: Time.now) }

    it 'returns all restaurants' do
      get '/restaurants', format: :json

      expect(json_response.count).to eq 2
      expect(json_response[0]['name']).to eq "Coco Curry"
      expect(json_response[1]['name']).to eq "Tukemen TETSU"
    end
  end

  describe 'create restaurant' do
    let(:restaurant_json) do
        { restaurant: {
            name: 'Tetsu',
            address: 'Roppongi',
            cuisine_type: 'Tonkatsu',
            offers_english_menu: true,
            walk_ins_ok: true,
            accepts_credit_cards: true,
            notes: 'This restaurant has tasty バーニャカウダ'
        } }
    end

    it 'creates the restaurant' do
      expect {
        post '/restaurants', restaurant_json, format: :json
      }.to change { Restaurant.count }.by(1)
    end

    it 'returns created restaurant' do
      post '/restaurants', restaurant_json, format: :json

      expect(json_response['name']).to eq "Tetsu"
      expect(json_response['address']).to eq "Roppongi"
      expect(json_response['cuisine_type']).to eq "Tonkatsu"
      expect(json_response['offers_english_menu']).to eq true
      expect(json_response['walk_ins_ok']).to eq true
      expect(json_response['accepts_credit_cards']).to eq true
      expect(json_response['notes']).to eq 'This restaurant has tasty バーニャカウダ'
    end
  end

  describe 'get restaurant by id' do
    let!(:tsukemen) { Restaurant.create!(name: "Tukemen TETSU", created_at: 2.days.ago) }

    it 'returns the restaurant' do
      get "/restaurants/#{tsukemen.id}", format: :json

      expect(json_response['name']).to eq "Tukemen TETSU"
    end
  end

  describe 'update restaurant' do
    let!(:tsukemen) { Restaurant.create!(name: "Tukemen TETSU", created_at: 2.days.ago) }

    let(:restaurant_json) do
      { restaurant: {
          name: 'Renamed',
          address: 'Roppongi',
          cuisine_type: 'Tonkatsu',
          offers_english_menu: true,
          walk_ins_ok: true,
          accepts_credit_cards: true
      } }
    end

    it 'updates the restaurant' do
      patch "/restaurants/#{tsukemen.id}", restaurant_json, format: :json

      changedRestaurant = Restaurant.find(tsukemen.id)
      expect(changedRestaurant.name).to eq "Renamed"
    end
  end
end