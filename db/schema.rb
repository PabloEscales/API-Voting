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

ActiveRecord::Schema[7.0].define(version: 2022_11_08_190436) do
  create_table "ballots", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "election_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "options"
    t.index ["election_id"], name: "index_ballots_on_election_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "content"
    t.integer "ballot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_options_on_ballot_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "election_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_registrations_on_election_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string "value"
    t.integer "registration_id", null: false
    t.integer "ballot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_votes_on_ballot_id"
    t.index ["registration_id"], name: "index_votes_on_registration_id"
  end

  add_foreign_key "ballots", "elections"
  add_foreign_key "options", "ballots"
  add_foreign_key "registrations", "elections"
  add_foreign_key "registrations", "users"
  add_foreign_key "votes", "ballots"
  add_foreign_key "votes", "registrations"
end
