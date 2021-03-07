class CreateClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :classifications do |t|
      t.integer :fixed_asset_id
      t.integer :name

      t.timestamps
    end
  end
end
