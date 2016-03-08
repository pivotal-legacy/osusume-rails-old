require 'rails_helper'

describe 'Cuisines API' do
  describe 'GET /cuisines' do
    it "returns all cuisines" do
      Cuisine.create!(name: "Japanese")
      get '/cuisines'
      expect(json_response.count).to eq 1
      expect(json_response.first.keys).to match_array(["id", "name"])
      expect(json_response[0]['name']).to eq "Japanese"
    end
  end
end
