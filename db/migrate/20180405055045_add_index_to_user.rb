class AddIndexToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :id, :integer
    add_index :users, :id
  end
end
