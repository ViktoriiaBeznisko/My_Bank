class CreateMoneyRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :money_requests do |t|
      t.integer :borrowed_id
      t.date :terms
      t.integer :amount
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
