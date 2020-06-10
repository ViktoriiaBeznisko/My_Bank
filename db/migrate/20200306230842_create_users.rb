class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.string :password_digest
      t.integer :uid
      t.integer :card_token
      t.string :card_type
      
      t.timestamps
    end
  end
end
