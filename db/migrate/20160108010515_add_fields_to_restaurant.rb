class AddFieldsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :cuisine_type, :string
    add_column :restaurants, :offers_english_menu, :boolean
    add_column :restaurants, :walk_ins_ok, :boolean
    add_column :restaurants, :accepts_credit_cards, :boolean
  end
end
