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

ActiveRecord::Schema[7.2].define(version: 2024_10_01_200819) do
  create_table "animal_plants", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.integer "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_animal_plants_on_animal_id"
    t.index ["plant_id"], name: "index_animal_plants_on_plant_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cares", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "growth_rates", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "common_name"
    t.text "other_names"
    t.string "scientific_name"
    t.string "family"
    t.text "description"
    t.string "image_url"
    t.integer "origin_id", null: false
    t.integer "type_id", null: false
    t.integer "watering_id", null: false
    t.integer "growth_rate_id", null: false
    t.integer "care_id", null: false
    t.boolean "thorny"
    t.boolean "invasive"
    t.boolean "tropical"
    t.boolean "indoor"
    t.boolean "flower"
    t.boolean "cones"
    t.boolean "fruits"
    t.boolean "edible_fruit"
    t.boolean "medicinal"
    t.integer "poisonous_to_humans"
    t.integer "poisonous_to_pets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_id"], name: "index_plants_on_care_id"
    t.index ["growth_rate_id"], name: "index_plants_on_growth_rate_id"
    t.index ["origin_id"], name: "index_plants_on_origin_id"
    t.index ["type_id"], name: "index_plants_on_type_id"
    t.index ["watering_id"], name: "index_plants_on_watering_id"
  end

  create_table "propagation_plants", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.integer "propagation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_propagation_plants_on_plant_id"
    t.index ["propagation_id"], name: "index_propagation_plants_on_propagation_id"
  end

  create_table "propagations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sunlight_plants", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.integer "sunlight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_sunlight_plants_on_plant_id"
    t.index ["sunlight_id"], name: "index_sunlight_plants_on_sunlight_id"
  end

  create_table "sunlights", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "waterings", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animal_plants", "animals"
  add_foreign_key "animal_plants", "plants"
  add_foreign_key "plants", "cares"
  add_foreign_key "plants", "growth_rates"
  add_foreign_key "plants", "origins"
  add_foreign_key "plants", "types"
  add_foreign_key "plants", "waterings"
  add_foreign_key "propagation_plants", "plants"
  add_foreign_key "propagation_plants", "propagations"
  add_foreign_key "sunlight_plants", "plants"
  add_foreign_key "sunlight_plants", "sunlights"
end
