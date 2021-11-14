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

ActiveRecord::Schema.define(version: 2021_11_14_165409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborators", force: :cascade do |t|
    t.string "collaborator_name"
    t.string "owner_name"
    t.string "workspace_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "workspace_id"
    t.index ["user_id"], name: "index_collaborators_on_user_id"
    t.index ["workspace_id"], name: "index_collaborators_on_workspace_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "workspace_name"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "workspace_id"
    t.string "nickname"
    t.boolean "open_on_click"
    t.text "notes"
    t.index ["workspace_id"], name: "index_links_on_workspace_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "workspace_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user"
    t.string "tags"
    t.text "notes"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_workspaces_on_user_id"
  end

  add_foreign_key "collaborators", "users"
  add_foreign_key "collaborators", "workspaces"
  add_foreign_key "links", "workspaces"
  add_foreign_key "workspaces", "users"
end
