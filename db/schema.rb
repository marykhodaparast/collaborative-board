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

ActiveRecord::Schema[8.1].define(version: 2026_11_01_153800) do
  create_table "boards", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drawings", force: :cascade do |t|
    t.integer "page_id", null: false
    t.string "nickname", null: false
    t.string "tool", default: "pen", null: false
    t.string "color", default: "#111827", null: false
    t.float "stroke_width", default: 3.0, null: false
    t.text "data", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id", "created_at"], name: "index_drawings_on_page_id_and_created_at"
    t.index ["page_id"], name: "index_drawings_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "board_id", null: false
    t.string "name", default: "Untitled page", null: false
    t.integer "position", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "position"], name: "index_pages_on_board_id_and_position", unique: true
    t.index ["board_id"], name: "index_pages_on_board_id"
  end

  add_foreign_key "drawings", "pages"
  add_foreign_key "pages", "boards"
end
