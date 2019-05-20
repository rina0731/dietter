class RemoveBodyFatFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :body_fat, :float
  end
end
