class TokenDecoder
  ALGORITHM = "HS256"
  attr_reader :token

  def initialize(authorization)
    @token = authorization.split(' ').last
  end

  def user_id
    JWT.decode(token, Rails.application.secrets.secret_key_base, true, { :algorithm => ALGORITHM })[0]["id"]
  end
end