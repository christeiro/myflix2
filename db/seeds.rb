# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

southpark = Video.create!(title: "Southpark", description: "Description of Southpark", small_cover_url: "/tmp/south_park.jpg", large_cover_url: "/tmp/south_park.jpg")
futurama = Video.create!(title: "Futurama", description: "Description of Futurama", small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg")
monk = Video.create!(title: "Monk", description: "Description of Monk", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg")