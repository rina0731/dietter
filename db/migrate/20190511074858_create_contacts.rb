class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :contact_id
      t.string :contact_title
      t.text :contact_text
      t.string :user_id
      t.timestamps
    end
  end
end
