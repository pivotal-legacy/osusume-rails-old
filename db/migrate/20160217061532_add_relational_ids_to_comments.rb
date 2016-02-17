class AddRelationalIdsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :restaurant_id, :integer
    add_column :comments, :user_id, :integer
  end
end
