FactoryGirl.define do
  factory :user do
    username "new_user"
    password "password"
  end
  factory :event do
    title  "My New Event"
    description "My event details"
    starts_at Time.now.to_date.to_time
    duration 2
    location "My event address"
    user_id 1
  end
  factory :comment do
    comment "My comment on an event"
    user_id 1
    event_id 1
  end
  factory :vote do
    user_id 1
    voteable_type ["Event","Comment"].sample
    voteable_id 1
  end
end
