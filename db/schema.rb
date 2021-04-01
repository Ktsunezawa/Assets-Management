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

ActiveRecord::Schema.define(version: 2021_04_01_062844) do

  create_table "classification_details", force: :cascade do |t|
    t.integer "classification"
    t.string "detail", default: ""
    t.integer "useful_life"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_classification_details_on_discarded_at"
  end

  create_table "fixed_assets", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "strongpoint_id"
    t.integer "request_status", default: 0, null: false
    t.integer "classification_detail_id"
    t.string "name", default: "", null: false
    t.integer "cost"
    t.text "memo"
    t.date "acquisition_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "post_images", force: :cascade do |t|
    t.integer "fixed_asset_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixed_asset_id"], name: "index_post_images_on_fixed_asset_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_staffs_on_discarded_at"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "strongpoints", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_strongpoints_on_discarded_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "post_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
