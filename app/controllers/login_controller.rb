class LoginController < ApplicationController

  def create
    user = User.find_by(login_params.slice(:email))

    if user && user.authenticate(login_params[:password])
      render json: {
        token: JWT.encode({id: user.id}, Rails.application.secrets.secret_key_base, 'HS256')
      }
    else
      render json: {}, status: 401
    end
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
