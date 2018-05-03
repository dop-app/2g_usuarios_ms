class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, index: true, unique: true
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.string :password_digest
      t.string :picture
      
      t.timestamps
    end
  end
end
