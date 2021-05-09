# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
10.times do |i|
  City.create!(name: Faker::Address.city, zip_code: rand(10000..95999))
  puts "#{i+1} Cities created"
end

User.destroy_all
20.times do |i|
  User.create!(email: Faker::Internet.email, phone_number: "06"+rand(10..99).to_s*4, description: Faker::Fantasy::Tolkien.poem)
  puts "#{i+1} User created"
end

Listing.destroy_all
# 5.times do |i|
#   Listing.create!(available_beds: rand(1..5), price: rand(20..100), description: Faker::Quotes::Shakespeare.king_richard_iii_quote, has_wifi: true, welcome_message: Faker::Lorem.paragraph(sentence_count: 5), host: User.all.sample, city: City.all.sample )
#   puts "#{i+1} Listings created"
# end

Reservation.destroy_all
# 10.times do |i|
#   Reservation.create!(start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'), end_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'), guest: User.all.sample, listing: Listing.all.sample)
#   puts "#{i+1} Reservations created"
# end

