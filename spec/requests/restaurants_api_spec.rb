require 'rails_helper'

describe 'Restaurants API' do
  describe 'get restaurants' do
    def json_response
      JSON.parse(response.body)
    end

    let!(:tsukemen) { Restaurant.create!(name: "Tukemen TETSU") }
    let!(:curry)    { Restaurant.create!(name: "Coco Curry") }

    it 'returns all restaurants' do
      get '/restaurants', format: :json

      expect(json_response.count).to eq 2
      expect(json_response[0]['name']).to eq "Tukemen TETSU"
      expect(json_response[1]['name']).to eq "Coco Curry"
    end
  end
end