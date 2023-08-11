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

ActiveRecord::Schema[7.0].define(version: 2023_08_11_000257) do
  create_table "diets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "taken_at"
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string "name"
    t.string "muscle_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "muscle_group_id"
    t.index ["muscle_group_id"], name: "index_exercise_types_on_muscle_group_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "workout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weight"
    t.integer "rep"
    t.integer "exercise_type_id"
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.decimal "calories", precision: 10, scale: 2
    t.float "protein"
    t.decimal "carbohydrates", precision: 10, scale: 2
    t.float "fat"
    t.integer "diet_id"
    t.integer "meal_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "serving_weight", default: 100
    t.index ["diet_id"], name: "index_foods_on_diet_id"
    t.index ["meal_type_id"], name: "index_foods_on_meal_type_id"
  end

  create_table "meal_types", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "goal"
    t.string "gender"
    t.integer "age"
    t.integer "height_in_feet"
    t.integer "height_in_inches"
    t.integer "weight"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "diets", "users"
  add_foreign_key "exercise_types", "muscle_groups"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "foods", "diets"
  add_foreign_key "foods", "meal_types"
  add_foreign_key "workouts", "users"
end
