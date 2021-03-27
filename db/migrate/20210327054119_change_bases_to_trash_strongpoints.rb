class ChangeBasesToTrashStrongpoints < ActiveRecord::Migration[5.2]
  def change
    rename_table :bases, :strongpoints
  end
end
