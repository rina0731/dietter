class AddUserIdToWeight < ActiveRecord::Migration[5.2]
  def change
    add_column :weights, :user_id, :integer
  end
end
