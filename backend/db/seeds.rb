# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = [
  'https://live.staticflickr.com/65535/51589338854_5b7a6aa0c4.jpg',
  'https://live.staticflickr.com/65535/51588681716_c1474187b0.jpg',
  'https://live.staticflickr.com/65535/51588897318_5cf408a6bd.jpg',
  'https://live.staticflickr.com/65535/51588897163_22b7671f16.jpg',
  'https://live.staticflickr.com/65535/51588680926_c125ca55da.jpg',
  'https://live.staticflickr.com/65535/51587846207_9d8b83f800.jpg',
  'https://live.staticflickr.com/65535/51589338224_17e4eec79c.jpg',
  'https://live.staticflickr.com/65535/51587846042_9d9b881e31.jpg',
  'https://live.staticflickr.com/65535/51587845892_b770594bd9.jpg',
  'https://live.staticflickr.com/65535/51588896513_b528a3b0f8.jpg'
]

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(from: 18, to: 35),
    image: images.sample
  )
end
