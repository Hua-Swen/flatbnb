# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'pry-byebug'

puts "destroying all databases"
Amenity.destroy_all
Flat.destroy_all
User.destroy_all
City.destroy_all


puts "creating 10 cities"



10.times do
  city = City.new(name: Faker::Address.city)
  city.save
end



puts "creating amenities"
amenities = ['Full kitchen',
'Washing Machine',
'Dryer' ,
'Dishwater',
'Wifi' ,
'TV',
'Bathroom Essentials',
'Bedroom Conforts',
'Coffee Maker',
'Bath' ,
'Fire Extinguisher' ,
'smoke alarm',
'Swimming Pool',
'Fridge',
'Iron ',
'Hair Dryer' ,
'Wifi',
'Cable TV',
'Air conditionning',
'Laptop Friendly-workspace',
'Free-Parking on premises',
'Pool',
'Stove',
'Microwave',
'Balcony',
'Waterfront']

amenities.each do |new_amenity|
  amenity = Amenity.new(name: new_amenity)
  amenity.save
end

puts "creating user"
user = User.new(email: "test@test.com", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                password: 123456)
user.save


puts " creating flat"
flat = Flat.new(name: "orchard road",
                description: "heart of singapore",
                number_of_guests: Faker::Number.number(digits: 2),
                price_per_night: Faker::Number.number(digits: 3) ,
                address_name: Faker::Address.full_address,
                type_of_flat: Faker::Address.community
        )


flat.user = user
flat.city = City.last

flat.save
puts "end of seeding"


