class RemoveWeightIdFromWeights < ActiveRecord::Migration[5.2]
  def change
    remove_column :weights, :weight_id, :integer
  end
end
