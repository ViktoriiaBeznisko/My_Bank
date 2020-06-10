# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_10_141557) do

  create_table "loans", force: :cascade do |t|
    t.integer "money_request_id"
    t.integer "lender_id"
    t.integer "borrowed_id"
    t.integer "open_transaction_id"
    t.integer "close_transaction_id"
    t.integer "status", default: 0
    t.decimal "percentage"
    t.datetime "opening_loan_day"
    t.date "closing_loan_day"
    t.decimal "total_paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount_cents", default: 0, null: false
  end

  create_table "money_requests", force: :cascade do |t|
    t.integer "borrowed_id"
    t.date "terms"
    t.integer "amount"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "borrowed_id"
    t.integer "lender_id"
    t.integer "loan_id"
    t.decimal "amount"
    t.integer "card_token"
    t.string "card_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.string "email"
    t.string "password_digest"
    t.integer "uid"
    t.integer "card_token"
    t.string "card_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
