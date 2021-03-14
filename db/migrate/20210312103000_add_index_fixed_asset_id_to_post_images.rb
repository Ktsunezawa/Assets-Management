class AddIndexFixedAssetIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_index :post_images, :fixed_asset_id
  end
end
