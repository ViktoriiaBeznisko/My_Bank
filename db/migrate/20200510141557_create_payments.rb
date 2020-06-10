class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :borrowed_id
      t.integer :lender_id
      t.integer :loan_id
      t.decimal :amount
      t.integer :card_token
      t.string :card_type
      
      t.timestamps
    end
  end
end
