require 'rails_helper'

describe Comment do
	
	describe 'relationships' do

		before(:all) do
			@user = User.create(name: "adam", password: "secret", password_confirmation: "secret")
			@restaurant = Restaurant.create(name: "Happy Burger")
		end

		it 'should associate user and restaurant with comment' do
			comment = @user.comments.create(content: "hello", restaurant_id: @restaurant.id)
			
			expect(@user.reload.comments).to include(comment)
			expect(comment.user).to eq(@user)

			expect(@restaurant.comments).to include(comment)
			expect(comment.restaurant).to eq(@restaurant)
		end	

	end

end