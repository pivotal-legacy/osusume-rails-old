class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def created_at
    super.to_i
  end
end
