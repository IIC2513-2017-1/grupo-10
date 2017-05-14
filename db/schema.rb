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

ActiveRecord::Schema.define(version: 20170514204640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "numbers", force: :cascade do |t|
    t.integer "number_in_raffle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "raffle_id"
    t.index ["raffle_id"], name: "index_numbers_on_raffle_id"
    t.index ["user_id"], name: "index_numbers_on_user_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "raffle_id"
    t.index ["raffle_id"], name: "index_prizes_on_raffle_id"
  end

  create_table "raffles", force: :cascade do |t|
    t.datetime "end_date"
    t.datetime "start_date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organizator_id"
    t.string "title"
    t.integer "price"
    t.integer "number_amount"
    t.boolean "private"
    t.index ["organizator_id"], name: "index_raffles_on_organizator_id"
  end

  create_table "reaction_representations", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "raffle_id"
    t.integer "reaction_representation_id"
    t.index ["raffle_id"], name: "index_reactions_on_raffle_id"
    t.index ["reaction_representation_id"], name: "index_reactions_on_reaction_representation_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "from_user_id"
    t.integer "to_user_id"
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
  end

  add_foreign_key "numbers", "raffles"
  add_foreign_key "numbers", "users"
  add_foreign_key "prizes", "raffles"
  add_foreign_key "reactions", "raffles"
  add_foreign_key "reactions", "reaction_representations"
  add_foreign_key "reactions", "users"
  add_foreign_key "requests", "users"
end
