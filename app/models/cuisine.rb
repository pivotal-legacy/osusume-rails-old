class Cuisine < ActiveRecord::Base
  validates :name, presence: true
end
