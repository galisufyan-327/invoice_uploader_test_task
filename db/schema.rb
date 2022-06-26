# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_26_165337) do
  create_table "invoice_batches", charset: "utf8", force: :cascade do |t|
    t.string "batch_file"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "errors_csv"
  end

  create_table "invoices", charset: "utf8", force: :cascade do |t|
    t.string "internal_id"
    t.float "amount"
    t.date "due_date"
    t.float "selling_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "invoice_batch_id"
  end

end
