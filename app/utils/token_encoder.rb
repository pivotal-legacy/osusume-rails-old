class TokenEncoder
  ALGORITHM = "HS256"
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def token
    JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
  end

  def payload
    {
        id: user.id
    }
  end
end