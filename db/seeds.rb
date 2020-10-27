require "open-uri"

puts "destroying data"
OrderItem.destroy_all
MenuItem.destroy_all
Order.destroy_all
User.destroy_all
Cloudinary::Api.delete_all_resources
puts "starting the seeds"


Kitchen.create()

User.create(
    first_name: "De Pits",
    last_name: "Administrator",
    email: "admin@gmail.com",
    password: "admin123",
    organization: "De Pits",
    admin: true
    )
    puts "Default admin accout created"
    puts "-----------"
User.create(
    first_name: "Test",
    last_name: "User",
    email: "user@email.com",
    password: "password",
    organization: "Test",
    admin: false
    )
puts "Test user created"
puts "-----------"
puts "Creating menu items"
menu = YAML.load_file(Rails.root.join("db/assets/menu_items.yml")).deep_symbolize_keys

menu[:daily_specials].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:combi_deals].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:losse_items].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:extras].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:koude_dranken].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:desserts].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

puts "-----------"
puts "import complete"