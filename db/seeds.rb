# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

# Booking.destroy_all
Asset.destroy_all
User.destroy_all

puts 'Creating fake data...'
15.times do
  sleep(1)
  seller = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456789"
  )
  seller.save!
  asset = Asset.new(
    name: Faker::JapaneseMedia::DragonBall.character,
    game: Faker::Game.title,
    description: Faker::JapaneseMedia::DragonBall.character,
    price: rand(1..1000),
    rental_length: rand(1..180),
    user: seller
  )
  # boat.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  asset.save!



  # client = User.new(
  #   name: Faker::Name.name,
  #   email: Faker::Internet.email,
  #   phone: Faker::PhoneNumber.cell_phone_in_e164,
  #   password: "123456789"
  # )

  # client.save!

  # booking = Booking.new(
  #   user: client,
  #   asset: asset,
  #   start_date: Date.today,
  #   end_date: Date.today + rand(4..30)
  # )
  # booking.total = (booking.end_date - booking.start_date) * asset.price
  # booking.save!
end
puts 'Finished!'
