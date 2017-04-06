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

ActiveRecord::Schema.define(version: 20170406152911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "event_id"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id", using: :btree
    t.index ["person_id"], name: "index_attendances_on_person_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "event_start"
    t.datetime "event_end"
    t.string   "event_type"
    t.string   "location"
    t.text     "notes"
    t.integer  "other_attendee_count"
    t.string   "type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "organisation_id"
    t.date     "member_start"
    t.date     "member_end"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organisation_id"], name: "index_memberships_on_organisation_id", using: :btree
    t.index ["person_id"], name: "index_memberships_on_person_id", using: :btree
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.integer  "activity"
    t.string   "email"
    t.string   "tel"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "postcode"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peers", force: :cascade do |t|
    t.integer  "people"
    t.integer  "participant_id"
    t.integer  "mentor_id"
    t.date     "peer_start"
    t.date     "peer_end"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nicknames"
    t.string   "tel"
    t.string   "email"
    t.string   "twitter"
    t.boolean  "is_accreditor"
    t.date     "dob"
    t.text     "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "type"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "attendances", "events"
  add_foreign_key "attendances", "people"
  add_foreign_key "memberships", "organisations"
  add_foreign_key "memberships", "people"
end
