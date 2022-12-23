# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Item.destroy_all
Bid.destroy_all
User.destroy_all


PASSWORD = "123"
super_user = User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@user.com",
  password: PASSWORD,
  # is_admin: true
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: PASSWORD
  )
end

users = User.all
RANDOM_PRICE = rand(50..1000)
RANDOM_PRICE_ITEM = rand(10..200)
30.times do
  created_at = Faker::Date.backward(days:365 * 5)

  i = Item.create(
    title: Faker::ElectricalComponents.active,
    description: Faker::ChuckNorris.fact,
    reserve_price: RANDOM_PRICE_ITEM,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )
  if i.valid?
    rand(1..5).times do
      Bid.create(amount: RANDOM_PRICE, item:i, user: users.sample)
    end
  end
end

items = Item.all
bids = Bid.all

puts Cowsay.say("Generated #{items.count} items", :frogs)
puts Cowsay.say("Generated #{bids.count} bids", :dragon)
puts Cowsay.say("Generated #{users.count} users", :koala)

# To run this file use command: rails db:seed
