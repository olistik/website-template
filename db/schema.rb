# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090817160329) do

  create_table "advertisement_levels", :force => true do |t|
    t.string "name"
  end

  create_table "advertisement_notes", :force => true do |t|
    t.text     "content"
    t.integer  "advertisement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisements", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.integer  "city_id"
    t.string   "address"
    t.string   "civic_number"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "contact_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "advertisement_level_id"
  end

  create_table "advertisements_categories", :id => false, :force => true do |t|
    t.integer "advertisement_id"
    t.integer "category_id"
  end

  create_table "advertisements_collections", :id => false, :force => true do |t|
    t.integer "advertisement_id"
    t.integer "collection_id"
  end

  create_table "advertisements_services", :id => false, :force => true do |t|
    t.integer "advertisement_id"
    t.integer "service_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "macro_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_services", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "service_id"
  end

  create_table "cell_actions", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.integer  "cell_container_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cell_containers", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cell_layouts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "cap"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cms_actions", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.integer  "cms_controller_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  create_table "cms_actions_roles", :id => false, :force => true do |t|
    t.integer "cms_action_id"
    t.integer "role_id"
  end

  create_table "cms_controllers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "composition_rules", :force => true do |t|
    t.integer  "cell_layout_id"
    t.integer  "cell_action_id"
    t.integer  "previous_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_details", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "contact_type_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "company_name"
    t.string   "vat"
    t.integer  "city_id"
    t.string   "address"
    t.string   "civic_number"
    t.string   "telephone"
    t.string   "email"
    t.string   "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "macro_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_entries", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "cms_action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "rating",             :limit => 10, :precision => 10, :scale => 0
    t.integer  "viewed"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pubblications", :force => true do |t|
    t.integer "photo_id"
    t.integer "advertisement_id"
    t.boolean "promote"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "nation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "seo_patterns", :force => true do |t|
    t.string  "table_name"
    t.string  "url"
    t.string  "title"
    t.string  "keywords"
    t.text    "description"
    t.text    "tags"
    t.string  "name"
    t.integer "cell_layout_id"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slug_navigators", :force => true do |t|
    t.integer  "slug_id"
    t.integer  "parent_id"
    t.string   "alt"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "url"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "keywords"
    t.text     "description"
    t.text     "tags"
    t.integer  "seo_object_id"
    t.string   "seo_object_type"
    t.integer  "seo_pattern_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
