# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating seeds..."
puts Schedule.create(label: 'Morning', time: '8:30 AM').attributes
puts Schedule.create(label: 'Afternoon', time: '12:30 PM').attributes
puts Schedule.create(label: 'Evening', time: '7:30 PM').attributes
puts "Finished seeds..."
