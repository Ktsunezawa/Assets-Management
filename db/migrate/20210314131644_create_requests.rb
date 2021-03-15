class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :staff_id
      t.string :integer
      t.string :manager_id
      t.string :integer
      t.string :request_status
      t.string :integer

      t.timestamps
    end
  end
end
