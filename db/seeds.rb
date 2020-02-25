# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Puppie.destroy_all


10.times {

  name = Faker::Creature::Dog.name
  age = rand(1..10)
  breed = Faker::Creature::Dog.breed
  price = rand(20..50)
  location = Faker::Address.full_address
  latitude = location.geocode[0]
  longitude = location.geocode[1]

  Puppie.create(name: name, age: age, breed: breed, price: price, user_id: 1, location: location, latitude: latitude, longitude:longitude)
}
