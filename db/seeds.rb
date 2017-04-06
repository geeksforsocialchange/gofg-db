# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-GB'

10.times do |n|
  Organisation.create(
    name:     Faker::Company.name,
    activity: rand(0..3),
    email:    Faker::Internet.email,
    tel:      Faker::PhoneNumber.cell_phone,
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city:     Faker::Address.city,
    postcode: Faker::Address.postcode,
    notes:    Faker::Lorem.paragraph(3)
  )
end

20.times do |n|
  participant = Participant.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Faker::Date.between(30.years.ago, 10.years.ago),
    email: Faker::Internet.email,
    tel: Faker::PhoneNumber.cell_phone,
    twitter: Faker::Twitter.user[:screen_name],
    notes: Faker::Lorem.paragraph(3)
  )
  mentor = Mentor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Faker::Date.between(30.years.ago, 10.years.ago),
    email: Faker::Internet.email,
    tel: Faker::PhoneNumber.cell_phone,
    twitter: Faker::Twitter.user[:screen_name],
    notes: Faker::Lorem.paragraph(3)
  )
  Peer.create(
    mentor: mentor,
    participant: participant,
    peer_start: Faker::Date.between(1.year.ago, Time.now),
    notes: Faker::Lorem.paragraph(1)
  )
  Coach.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Faker::Date.between(30.years.ago, 10.years.ago),
    email: Faker::Internet.email,
    tel: Faker::PhoneNumber.cell_phone,
    twitter: Faker::Twitter.user[:screen_name],
    is_accreditor: true,
    notes: Faker::Lorem.paragraph(3)
  )
  member_start = Faker::Date.between(1.year.ago, Time.now)
  Membership.create(
    person: participant,
    organisation: Organisation.find(participant.id % 10 + 1),
    member_start: member_start,
    member_end: member_start + rand(10..50).weeks
  )
end

50.times do |n|
  start = Faker::Date.between(1.year.ago, 2.years.from_now)
  Event.create(
    name: ["Boxing", "Theatre", "Football", "Dance"].sample + " session #{n}",
    event_start: start,
    event_end: start + rand(0..5).hours,
    location: Faker::Company.name,
    notes: Faker::Lorem.paragraph(1),
    other_attendee_count: rand(0..20),
    type: ["Fieldwork", "Activity", "Meeting"].sample
  )
end
