class CreateClassificationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :classification_details do |t|
      t.integer :classification
      t.string :detail
      t.integer :useful_life
      t.integer :period

      t.timestamps
    end
  end
end
