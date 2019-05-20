class RenameWeightColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :weight, :latest_weight
  end
end
