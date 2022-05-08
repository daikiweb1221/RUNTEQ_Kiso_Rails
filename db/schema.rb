ActiveRecord::Schema.define(version: 2022_05_05_112303) do

  create_table "boards", force: :cascade do |t|
    t.string "title", null: false
    t.string "body", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
