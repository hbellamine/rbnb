# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying all puppies...'
Puppie.destroy_all
puts 'Seeding fresh new puppies!'
name = Faker::Creature::Dog.name
age = rand(1..10)
breed = Faker::Creature::Dog.breed
price = rand(20..50)
location = "Lisboa"

Puppie.create(name: name, age: age, breed: breed, price: price, user_id: 1, location: location)

name = Faker::Creature::Dog.name
age = rand(1..10)
breed = Faker::Creature::Dog.breed
price = rand(20..50)
location = "Rua conde redondo, Lisboa"

Puppie.create(name: name, age: age, breed: breed, price: price, user_id: 1, location: location)

name = Faker::Creature::Dog.name
age = rand(1..10)
breed = Faker::Creature::Dog.breed
price = rand(20..50)
location = "Bairro alto"

Puppie.create(name: name, age: age, breed: breed, price: price, user_id: 1, location: location)

name = Faker::Creature::Dog.name
age = rand(1..10)
breed = Faker::Creature::Dog.breed
price = rand(20..50)
location = "Chiado"

Puppie.create(name: name, age: age, breed: breed, price: price, user_id: 1, location: location)

name = Faker::Creature::Dog.name
age = rand(1..10)
breed = Faker::Creature::Dog.breed
price = rand(20..50)
location = "Rua Joaquina, Lisboa"

Puppie.create(name: name, age: age, breed: breed, price: price, user_id: 1, location: location)

puts 'All done!'
