class Restaurant < ActiveRecord::Base
  belongs_to :user

  def created_at
    super.to_i
  end
end
