class AddDiscardedAtToClassificationDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :classification_details, :discarded_at, :datetime
    add_index :classification_details, :discarded_at
  end
end
