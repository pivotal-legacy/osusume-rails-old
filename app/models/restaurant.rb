class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photo_urls
  has_many :likes
  belongs_to :cuisine
  accepts_nested_attributes_for :photo_urls

  def self.likes_for_user(user_id)
    joins(:likes)
        .where('likes.user_id = ?', user_id)
  end

  def created_at
    super.to_i
  end

end
