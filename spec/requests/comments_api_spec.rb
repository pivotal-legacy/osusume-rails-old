require 'rails_helper'

describe 'Comments API' do
  describe 'create comment' do

    let(:comment_json) do
      { comment: {
          content: 'hello this is a comment!',
          restaurant_id: 1
        }
      }
    end
    let(:user) { User.create!(name: 'Hachiko', password: 'password') }
    let(:token) { TokenEncoder.new(user).token }

    it 'creates comment' do
      expect {
        post '/comments', comment_json, { format: :json, authorization: "Bearer #{token}" }
      }.to change { Comment.count }.by(1)
    end

  end
end