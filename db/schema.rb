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

ActiveRecord::Schema.define(version: 20170611172247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "numbers", id: :serial, force: :cascade do |t|
    t.integer "number_in_raffle", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "raffle_id", null: false
    t.index ["raffle_id"], name: "index_numbers_on_raffle_id"
    t.index ["user_id"], name: "index_numbers_on_user_id"
  end

  create_table "prizes", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "raffle_id", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["raffle_id"], name: "index_prizes_on_raffle_id"
  end

  create_table "raffles", id: :serial, force: :cascade do |t|
    t.datetime "end_date", null: false
    t.datetime "start_date", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organizator_id", null: false
    t.string "title", null: false
    t.integer "price", null: false
    t.integer "number_amount", null: false
    t.boolean "private", null: false
    t.index ["organizator_id"], name: "index_raffles_on_organizator_id"
  end

  create_table "reaction_representations", id: :serial, force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "reactions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "raffle_id", null: false
    t.integer "reaction_representation_id", null: false
    t.index ["raffle_id"], name: "index_reactions_on_raffle_id"
    t.index ["reaction_representation_id"], name: "index_reactions_on_reaction_representation_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount", null: false
    t.boolean "approved", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "transactions", id: :serial, force: :cascade do |t|
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "from_user_id", null: false
    t.integer "to_user_id", null: false
    t.bigint "raffle_id"
    t.index ["raffle_id"], name: "index_transactions_on_raffle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "mail"
    t.string "name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.integer "amount"
    t.string "password_digest"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  add_foreign_key "numbers", "raffles"
  add_foreign_key "numbers", "users"
  add_foreign_key "prizes", "raffles"
  add_foreign_key "reactions", "raffles"
  add_foreign_key "reactions", "reaction_representations"
  add_foreign_key "reactions", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "transactions", "raffles"
end
