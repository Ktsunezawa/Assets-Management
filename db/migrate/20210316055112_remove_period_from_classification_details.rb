class RemovePeriodFromClassificationDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :classification_details, :period, :integer
  end
end
