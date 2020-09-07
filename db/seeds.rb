require "open-uri"
require 'faker'

puts "destroying data"
OrderItem.destroy_all
MenuItem.destroy_all
Order.destroy_all
User.destroy_all
Cloudinary::Api.delete_all_resources
puts "starting the seeds"

User.create(
    first_name: "De Pits",
    last_name: "Administrator",
    email: "admin@gmail.com",
    password: "admin123",
    organization: "De Pits",
    admin: true
    )
puts "Admin accout created"

puts "creating users "
4.times do |num|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "test#{num}@gmail.com",
    password: "password",
    organization: Faker::Company.name,
    admin: false
  )
end
puts "#{User.count} user's created"

puts "-----------"
puts "Creating menu items"
menu = YAML.load_file(Rails.root.join("db/assets/menu_items.yml")).deep_symbolize_keys

menu[:daily_specials].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:combi_deals].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:losse_items].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:extras].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:koude_dranken].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:desserts].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

puts "-----------"
puts "Creating order items"

20.times do
  order = Order.new(
    user: User.all.sample,
    status: "not ready",
    comment: ["allergy", "extra", "hold the sauce", "", "", ""].sample,
    time_started: Time.now
    )

  order.save!
  rand(1..5).times do
    order_item = OrderItem.new(
      quantity: rand(1..3),
      menu_item: MenuItem.all.sample,
      order: order
      )
    order_item.save!
  end
end

puts "Orders created"
