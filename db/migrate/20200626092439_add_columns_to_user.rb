class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
