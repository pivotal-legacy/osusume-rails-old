class AddLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
end
