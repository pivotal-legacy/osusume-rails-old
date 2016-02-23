require 'rails_helper'

describe 'Comments API' do
  describe 'create comment' do

    let(:comment_json) do
      { comment: {
          content: 'hello this is a comment!'
        }
      }
    end
    let(:user) { User.create!(name: 'Hachiko', password: 'password') }
    let(:token) { TokenEncoder.new(user).token }

    it 'creates comment' do
      expect {
        post '/restaurants/1/comments', comment_json, { format: :json, authorization: "Bearer #{token}" }
      }.to change { Comment.count }.by(1)

      created_comment = Comment.last
      expect(created_comment.restaurant_id).to eq 1
      expect(created_comment.user_id).to eq user.id
    end

    it 'responds with 201 status on creation' do
      post '/restaurants/1/comments', comment_json, { format: :json, authorization: "Bearer #{token}" }
      expect(response.status).to eq 201
    end

  end
end
