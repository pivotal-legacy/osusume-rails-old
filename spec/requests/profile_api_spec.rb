require 'rails_helper'

describe 'Profile API' do
  let!(:user) { User.create!(name: 'Hachiko', password: 'password') }
  let!(:token) { TokenEncoder.new(user).token }

  describe 'GET /profile' do
    it "returns current user profile" do
      get "/profile", {}, {format: :json, authorization: "Bearer #{token}"}
      expect(json_response.keys).to match_array(["name"])
      expect(json_response['name']).to eq "Hachiko"
    end
  end
end
