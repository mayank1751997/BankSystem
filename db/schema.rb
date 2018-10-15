# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_10_182939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "client_id"
    t.decimal "balance"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bank_accounts_on_client_id"
  end

  create_table "bank_transactions", force: :cascade do |t|
    t.decimal "amount"
    t.string "transaction_type"
    t.bigint "bank_account_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_account_id"], name: "index_bank_transactions_on_bank_account_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "bank_name"
    t.string "bank_address"
    t.integer "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "client_number"
    t.string "client_address"
    t.string "client_dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bank_transactions", "bank_accounts"
end
