class AddsNotesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :notes, :text
  end
end
