class AddDiscardedAtToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :discarded_at, :datetime
    add_index :staffs, :discarded_at
  end
end
