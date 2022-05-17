# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all


User.create(email: 'testpourthp@yopmail.com', first_name: 'Marla')
User.create(email: 'test4thp@yopmail.com', first_name: 'Le M')
User.create(email: 'testforthp@yopmail.com', first_name: 'Luke Skywalker')

10.times do |t|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,  description: Faker::Lorem.sentence(word_count: 6), password: "Miaouuuuu", email: "email#{t+20}@yopmail.com")
end

20.times do
  Event.create(
    start_date: Faker::Date.forward(days: 365), duration: [5,10,20,30].sample, title: Faker::Restaurant.name, description: Faker::Lorem.sentence(word_count: 20), price: rand(1..1000), location: Faker::Address.street_address, admin_id: User.all.sample.id)
end


10.times do 
  Attendance.create(user_id: User.all.sample.id, event_id: Event.all.sample.id)
end