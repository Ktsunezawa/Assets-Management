class CreateBases < ActiveRecord::Migration[5.2]
  def change
    create_table :bases do |t|
      t.integer :staff_id
      t.string :name

      t.timestamps
    end
  end
end
