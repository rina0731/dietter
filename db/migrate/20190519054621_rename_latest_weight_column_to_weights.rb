class RenameLatestWeightColumnToWeights < ActiveRecord::Migration[5.2]
  def change
  	rename_column :weights, :latest_weight, :weight_change

  end
end
