class AddDiscardedAtToBases < ActiveRecord::Migration[5.2]
  def change
    add_column :bases, :discarded_at, :datetime
    add_index :bases, :discarded_at
  end
end
