class ProfileController < ApplicationController
  def show
    render json: UserSerializer.new(current_user)
  end
end
