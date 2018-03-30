class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :age
      t.string :email
      t.string :gender
      t.string :picture
      t.string :identifier

      t.timestamps
    end
  end
end
