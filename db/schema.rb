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

ActiveRecord::Schema.define(version: 2022_04_17_050909) do

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "grade"
    t.string "subject"
    t.binary "content"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "recommended"
    t.string "comment"
    t.integer "lesson_id", null: false
    t.index ["lesson_id"], name: "index_reviews_on_lesson_id"
  end

  add_foreign_key "reviews", "lessons"
end
