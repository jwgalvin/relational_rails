# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
science = Cult.create!(name: "Scientology", member_size: 4000)
marshall = heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
bonnie = heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
david = waco.members.create!(name: "David Khouresh", married: true, children: 32)
thomas = heaven.members.create!(name: "Thomas Nichols", married: false, children: 3)
