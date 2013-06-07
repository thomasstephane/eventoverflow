ActiveRecord::Schema.define(:version => 20130606180840) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "starts_at"
    t.integer  "duration"
    t.text     "location"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.string   "voteable_type"
    t.integer  "user_id"
    t.integer  "voteable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
