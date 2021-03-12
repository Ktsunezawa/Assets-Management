class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :fixed_asset_id
      t.string :image_id

      t.timestamps
    end
  end
end
