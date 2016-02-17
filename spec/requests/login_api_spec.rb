require 'rails_helper'

describe 'Login API' do
  describe 'login' do
    let(:user) { User.create!(email: 'osusume@pivotal.io', password: 'secret') }

    let(:login_json) do
      {
        login: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns a jwt token' do
      post '/login', login_json, format: :json

      payload = {id: user.id}
      token   = JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')

      expect(json_response['token']).to eq token
    end

    it 'returns 401 when the credentials do not match' do
      post '/login', {login: {email: user.email, password: 'wrong-password'}}, format: :json

      expect(response.status).to eq 401
    end

    it 'returns 401 when the user does not exist' do
      post '/login', {login: {email: 'does-not-exist@pivotal.io', password: 'wrong-password'}}, format: :json

      expect(response.status).to eq 401
    end
  end
end