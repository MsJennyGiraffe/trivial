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

ActiveRecord::Schema.define(version: 20160731215547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string  "text"
    t.integer "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
  end

  create_table "round_questions", force: :cascade do |t|
    t.integer "question_id"
    t.integer "round_id"
    t.index ["question_id"], name: "index_round_questions_on_question_id", using: :btree
    t.index ["round_id"], name: "index_round_questions_on_round_id", using: :btree
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "correct",    default: 0
    t.integer  "out_of",     default: 10
    t.integer  "users_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["users_id"], name: "index_rounds_on_users_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "screen_name"
    t.string "uid"
    t.string "oauth_token"
    t.string "oauth_token_secret"
    t.string "picture"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "round_questions", "questions"
  add_foreign_key "round_questions", "rounds"
  add_foreign_key "rounds", "users", column: "users_id"
end
