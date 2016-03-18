class Like < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :restaurant_id
end
