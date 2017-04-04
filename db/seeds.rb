# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-GB'

20.times do |n|
  Participant.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Faker::Date.between(30.years.ago, 10.years.ago),
    email: Faker::Internet.email,
    tel: Faker::PhoneNumber.cell_phone,
    twitter: Faker::Twitter.user[:screen_name],
    notes: Faker::Lorem.paragraphs(3)
  )
end
