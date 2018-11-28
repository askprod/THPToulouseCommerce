# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#Seed accounts ONLY if developement env. we don't want random users in production!
if Rails.env="development"
    5.times do |index|
        User.create!(username: "Chaton#{index+1}", address: Faker::Address.street_address, first_name: Faker::Name.first_name ,last_name: Faker::Name.last_name, email: "user#{index+1}@mail.com", password: "password#{index+1}")
    end
end

20.times do |index| 
    Item.create!(title: Faker::Cat.name, description: Faker::Cat.breed, price: Faker::Number.decimal(1), image_url: "chat#{index+1}.png")
end

