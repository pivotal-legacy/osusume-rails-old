class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photo_urls
  accepts_nested_attributes_for :photo_urls

  def created_at
    super.to_i
  end

end
