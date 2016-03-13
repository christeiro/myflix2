# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cartoons = Category.create!(name: "Cartoons")
dramas = Category.create!(name: "TV Dramas")

southpark = Video.create!(title: "Southpark", description: "Description of Southpark", small_cover_url: "/tmp/south_park.jpg", large_cover_url: "/tmp/south_park.jpg", category: cartoons)
futurama = Video.create!(title: "Futurama", description: "Description of Futurama", small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: cartoons)
monk = Video.create!(title: "Monk", description: "Description of Monk", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: dramas)

batman = Video.create!(title: "Batman", description: "Description of Batman", small_cover_url: "/tmp/south_park.jpg", large_cover_url: "/tmp/south_park.jpg", category: cartoons)
robin = Video.create!(title: "Robin", description: "Description of Robin", small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: cartoons)
hospital = Video.create!(title: "Hospital", description: "Description of Hospital", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: dramas)

viking = Video.create!(title: "Viking", description: "Description of Viking", small_cover_url: "/tmp/south_park.jpg", large_cover_url: "/tmp/south_park.jpg", category: cartoons)
mouse = Video.create!(title: "Mouse", description: "Description of Mouse", small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: cartoons)

user_mike = User.create!(full_name: Faker::Name.name, email: Faker::Internet.email('mike'), password: Faker::Internet.password)
user_ted = User.create!(full_name: Faker::Name.name, email: Faker::Internet.email('ted'), password: Faker::Internet.password)
user_test = User.create!(full_name: "Test user", email: "test@test.ee", password: "test")

mouse_review1 = Review.create!(rating: 3, description: Faker::Lorem.paragraph(2), video: mouse, user: user_mike)
mouse_review2 = Review.create!(rating: 5, description: Faker::Lorem.paragraph(2), video: mouse, user: user_ted)

queue_item1 = QueueItem.create!(user: user_test, video: southpark)
queue_item2 = QueueItem.create!(user: user_test, video: monk)