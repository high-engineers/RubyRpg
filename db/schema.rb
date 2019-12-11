# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Characters", primary_key: "EntityId", force: :cascade do |t|
  end

  create_table "Conditions", primary_key: "Id", force: :cascade do |t|
    t.integer "Health", null: false
    t.integer "MaxHealth", null: false
    t.integer "Mana", null: false
    t.integer "MaxMana", null: false
    t.integer "Experience", null: false
    t.integer "MaxExperience", null: false
  end

  create_table "Entities", primary_key: "Id", force: :cascade do |t|
    t.string "Name", limit: 30, null: false
    t.integer "Age", null: false
    t.integer "Level", null: false
    t.string "Story", limit: 100, null: false
    t.string "Quote", limit: 50, null: false
    t.string "Sex", limit: 1, null: false
    t.integer "ConditionId", null: false
    t.integer "RaceId", null: false
    t.integer "StatisticsId", null: false
  end

  create_table "EntitySkills", primary_key: ["EntityId", "SkillId"], force: :cascade do |t|
    t.integer "EntityId", null: false
    t.integer "SkillId", null: false
  end

  create_table "Npcs", id: false, force: :cascade do |t|
    t.integer "EntityId", null: false
  end

  create_table "Races", primary_key: "Id", force: :cascade do |t|
    t.string "Name", limit: 30, null: false
    t.string "Description", limit: 100, null: false
    t.string "BackStory", limit: 200, null: false
  end

  create_table "Skills", primary_key: "Id", force: :cascade do |t|
    t.string "Name", limit: 30, null: false
    t.string "Description", limit: 100, null: false
    t.integer "ManaCost", null: false
    t.integer "Damage", null: false
    t.integer "Multiplier", null: false
  end

  create_table "Statistics", primary_key: "Id", force: :cascade do |t|
    t.integer "Strength", null: false
    t.integer "Dexterity", null: false
    t.integer "Inteligence", null: false
    t.integer "Wisdom", null: false
    t.integer "Luck", null: false
    t.integer "Charisma", null: false
  end

  create_table "Users", primary_key: "Id", force: :cascade do |t|
    t.string "Login", limit: 30, null: false
    t.string "Password", limit: 30, null: false
    t.string "Email", limit: 50, null: false
    t.integer "CharacterId", null: false
  end

  add_foreign_key "Characters", "Entities", column: "EntityId", primary_key: "Id"
  add_foreign_key "Entities", "Conditions", column: "ConditionId", primary_key: "Id"
  add_foreign_key "Entities", "Races", column: "RaceId", primary_key: "Id"
  add_foreign_key "Entities", "Statistics", column: "StatisticsId", primary_key: "Id"
  add_foreign_key "EntitySkills", "Entities", column: "EntityId", primary_key: "Id"
  add_foreign_key "EntitySkills", "Skills", column: "SkillId", primary_key: "Id"
  add_foreign_key "Npcs", "Entities", column: "EntityId", primary_key: "Id"
  add_foreign_key "Users", "Characters", column: "CharacterId", primary_key: "EntityId"
end
