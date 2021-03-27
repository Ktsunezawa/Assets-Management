class CreateFixedAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_assets do |t|
      t.integer :staff_id
      t.integer :strongpoint_id
      t.integer :request_status, null: false, default: 0
      t.integer :classification_detail_id
      t.string :name, null: false, default: ""
      t.integer :cost
      t.text :memo
      t.date :acquisition_date

      t.timestamps
    end
  end
end
