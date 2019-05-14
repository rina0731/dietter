class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.integer :weight_id
      t.float :latest_weight

      t.timestamps
    end
  end
end
