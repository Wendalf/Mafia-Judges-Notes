# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 15.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: "password",
#     name: Faker::Name.name 
#     )
# end
User.create(
  email: "1@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "2@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "3@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "4@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "5@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "6@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "7@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "8@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "9@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "10@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "11@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "12@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "13@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "14@1.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "15@1.com",
  password: "123456",
  name: Faker::Name.name
  )

Character.create(
  name: "Town",
  description: "Town couldn't do anything at night, but could discuss and have the ability to vote and kill one suspicious person after every night."
  )

Character.create(
  name: "Mafia",
  description: "Mafia can kill one person per night secretly.",
  ability: "kill",
  ability_effect: -1
  )

Character.create(
  name: "Police",
  description: "Police check one person to see if he/she is the mafia per night secretly.",
  ability: "check",
  ability_effect: 0
  )

Character.create(
  name: "Doctor",
  description: "Doctor can save one person per night secretly.",
  ability: "heal",
  ability_effect: 1
  )