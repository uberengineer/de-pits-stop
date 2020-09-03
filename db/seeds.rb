require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

menu = YAML.load_file(Rails.root.join("db/assets/menu_items.yml")).deep_symbolize_keys
MenuItem.destroy_all
Cloudinary::Api.delete_all_resources
puts "Creating menu items"

menu[:daily_specials].each do |menu_item|
  # p menu_item
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

50.times do
  order = Order.new(
    user: User.sample,
    status: ["basket", "ordered", "accepted", "cancelled", "awaiting collection", "completed"].sample,
    comment: ["allergy", "extra", "hold the sauce", "", "", ""].sample
  )
  order.save!
  rand(1..5).times do
    order_item = OrderItem.new(
      quantity: rand(1..5),
      menu_item: MenuItem.sample(5),
      order: order,
    )
    order_item.save!
  end
end
