require 'rails_helper'

describe RestaurantsController, type: :controller do
  describe '#index' do
    it 'returns the restaurants' do
      get :index
      expect(response).to be_success

      expect(assigns(:restaurants)).to match_array([{name: 'first restaurant', id: 1}, {name: 'second restaurant', id: 2}])
    end
  end
end