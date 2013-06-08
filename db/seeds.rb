# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Dexter", password: "pass", admin: true)
User.create(username: "Ken", password: "pass", admin: true)
User.create(username: "Allen", password: "pass", admin: true)
User.create(username: "Stephan", password: "pass", admin: true)

4.times do |i|
  user = User.find(i + 1) 
  5.times do |j|
    day = 1 + rand(30)
    Event.create(user_id: user.id,
                title: "Event of #{user.username} nb #{j + 1}",
                description: "Description by #{user.username} for event #{j + 1}",
                starts_at: Time.new(2013, 6, day),
                duration: 1,
                location: "DBC of course" )
  end
end

do_it = [true, false]
vote = [1,-1]

Event.all.each do |event|
  event.comments << Comment.create(user_id: (1 + rand(4)), comment: "Comment text")
  4.times do |i|
    event.votes << Vote.create(user_id: (1 + i), counter: vote.sample ) if do_it.sample
  end
end

Comment.all.each do |comment|
  4.times do |i|
    comment.votes << Vote.create(user_id: (1 + i), counter: vote.sample ) if do_it.sample
  end
end

