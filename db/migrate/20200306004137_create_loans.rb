class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.integer :money_request_id
      t.integer :lender_id
      t.integer :borrowed_id
      t.integer :open_transaction_id
      t.integer :close_transaction_id
      t.integer :status, default: 0
      t.decimal :percentage 
      t.datetime :opening_loan_day
      t.date :closing_loan_day
      t.decimal :total_paid
      
      t.timestamps
    end
    add_money :loans, :amount, currency: { present: false }
  end
end
