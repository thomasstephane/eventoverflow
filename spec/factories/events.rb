FactoryGirl.define do
  factory :user do
    username "new_user"
    password "password"
    email "email@test.com"
  end

  factory :event do
    title  "My New Event"
    description "My event details"
    starts_at (Time.now + 1000000).to_date.to_time
    duration 2
    venue_name "San Francisco"
    street "San Francisco"
    zip "San Francisco"
    region "San Francisco"
    city "San Francisco"
    association :user
  end

  factory :comment do
    comment "My comment on an event"
    association :event
    association :commentable, :factory => :event
    association :user
  end

  factory :vote_question do
    counter 1 
    association :votable, :factory => :event
    association :user
  end

  factory :vote_answer do
    counter 1 
    association :votable, :factory => :comment
    association :user
  end
end
