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
  email: "2@2.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "3@3.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "4@4.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "5@5.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "6@6.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "7@7.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "8@8.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "9@9.com",
  password: "123456",
  name: Faker::Name.name
  )

User.create(
  email: "10@10.com",
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
  ability: "kill"
  )

Character.create(
  name: "Police",
  description: "Police check one person to see if he/she is the mafia per night secretly.",
  ability: "check"
  )

Character.create(
  name: "Doctor",
  description: "Doctor can save one person per night secretly.",
  ability: "save"
  )