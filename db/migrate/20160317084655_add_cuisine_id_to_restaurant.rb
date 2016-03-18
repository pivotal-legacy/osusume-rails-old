class AddCuisineIdToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisine_id, :integer
  end
end
