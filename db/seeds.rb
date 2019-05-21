# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Dog.delete_all
User.delete_all

puts "Creating new users and dogs"


#30 users for user model
30.times do

  email = Faker::Internet.email
  password = Faker::Code.sin

  User.create!(email: email, password: password)

end

puts "Users created"

#50 dogs for dog model
50.times do

  name = Faker::Creature::Dog.name
  age = rand(0..20)
  breed = Faker::Creature::Dog.breed
  size = Faker::Creature::Dog.size
  price = rand(5..50)
  address = Faker::Address.city

  x = Dog.new(name: name, age: age, breed: breed, size: size, price: price, address: address)
  x.user = User.order("RANDOM()").first
  x.save

end

puts "Dogs created"
