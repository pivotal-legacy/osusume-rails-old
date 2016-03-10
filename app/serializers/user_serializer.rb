class UserSerializer
  def initialize(user)
    @user = user
  end

  def as_json(*)
    {
        "name" => @user.name
    }
  end
end
