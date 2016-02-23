class CreatePhotoUrls < ActiveRecord::Migration
  def change
    create_table :photo_urls do |t|
      t.string :url, default: ""
      t.integer :restaurant_id

      t.timestamps
    end

    remove_column :restaurants, :photo_url
  end
end
