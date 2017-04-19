class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :session_token, null: false

      t.timestamps
    end
    add_index :users, :session_token
    add_index :users, :password_digest
    add_index :users, :username, unique: true
  end
end
