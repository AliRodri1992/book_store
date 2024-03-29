# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  Store.create(codename: Faker::Company.name, address: Faker::Address.street_address)
  Book.create(title: Faker::Book.title, author: Faker::Book.author, year: Faker::Number.between(from: 1900, to: 2030))
end