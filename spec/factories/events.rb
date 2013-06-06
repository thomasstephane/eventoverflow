FactoryGirl.define do
  factory :user do
    username "new_user"
    password "password"
  end
  factory :event do
    title  "My New Event"
    description "My event details"
    user_id 1
  end
  factory :comment do
    comment "My comment on an event"
    user_id 1
    event_id 1
  end
end