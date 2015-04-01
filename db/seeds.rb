# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["asian", "mexican", "indian", "italian", "lebanese", "french", "american", "korean", "arabic", "turkish", "indonesian", "thai"].each do |cat|
  Category.create(name: cat)
end

25.times.each do
  owner = User.create(
          email: Faker::Internet.email,
          password: "12345678",
          password_confirmation: "12345678",
          role: "owner"
          )

  patron = User.create(
          email: Faker::Internet.email,
          password: "12345678",
          password_confirmation: "12345678",
          role: "patron"
          )

  5.times.each do
    restaurant =  Restaurant.create(
                  name: Faker::Company.name,
                  description: Faker::Lorem.paragraph(5),
                  full_address: Faker::Address.street_address+", "+Faker::Address.postcode+" "+Faker::Address.city,
                  phone: Faker::PhoneNumber.phone_number,
                  user_id: owner.id,
                  category_id: rand(1..12)
                  )
    20.times.each do
                  Rating.create(
                  user_id: User.where(role:'patron').order('RANDOM()').first.id,
                  restaurant_id: restaurant.id,
                  value: rand(1..5)
                  )
  end
end

end

# 50.times.each do
#   Restaurant.create(
#   name: Faker::Company.name,
#   description: Faker::Lorem.paragraph(5),
#   full_address: Faker::Address.street_address+", "+Faker::Address.postcode+" "+Faker::Address.city,
#   phone: Faker::PhoneNumber.phone_number,
#   user_id: rand(1..99),
#   category_id: rand(1..12)
#   )
# end
#
# 50.times.each do
#   Rating.create(
#   user_id: rand(1..99),
#   restaurant_id: rand(1..50),
#   value: rand(1..5)
#   )
# end
