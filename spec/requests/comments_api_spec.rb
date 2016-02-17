require 'rails_helper'

describe 'Comments API' do
	def json_response
		JSON.parse(response.body)
	end

	describe 'create comment' do

		let(:comment_json) { { comment: { text: 'hello this is a comment!' } } }
    let(:user) { User.create!(name: 'Hachiko', password: 'password') }
    let(:token) { TokenEncoder.new(user).token }

		it 'creates comment' do
			expect {
				post '/comments', comment_json, { format: :json, authorization: "Bearer #{token}" }
			}.to change { Comment.count }.by(1)
		end

	end
end