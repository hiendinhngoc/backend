# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = [
  'https://www.flickr.com/photos/122668677@N03/51588681716/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51589338854/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51588897318/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51588897163/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51588680926/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51587846207/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51589338224/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51587846042/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51588896513/in/dateposted-public/',
  'https://www.flickr.com/photos/122668677@N03/51587845892/in/dateposted-public/'
]

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(from: 18, to: 35),
    image: images.sample
  )
end
