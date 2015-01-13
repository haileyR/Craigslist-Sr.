require 'faker'

10.times {Category.create(
  title: Faker::Lorem.word
  )}


50.times {Listing.create(
  owner_email: Faker::Internet.email,
  title: Faker::Lorem.word,
  category_id: rand(1..10),
  content: Faker::Lorem.paragraph,
  location: Faker::Address.city,
  price: rand(10..1000)
  )}
