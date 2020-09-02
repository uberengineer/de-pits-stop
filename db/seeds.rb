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
puts "Creating menu items"

menu[:daily_specials].each do |menu_item|
  f = MenuItem.create(name: menu_item[:name], description: menu_item[:description], category: menu_item[:category], price: menu_item[:price])
  file = menu_item[:image]
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:combi_deals].each do |menu_item|
  f = MenuItem.create(name: menu_item[:name], description: menu_item[:description], category: menu_item[:category], price: menu_item[:price])
  file = menu_item[:image]
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:losse_items].each do |menu_item|
  f = MenuItem.create(name: menu_item[:name], description: menu_item[:description], category: menu_item[:category], price: menu_item[:price])
  file = menu_item[:image]
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:extras].each do |menu_item|
  f = MenuItem.create(name: menu_item[:name], description: menu_item[:description], category: menu_item[:category], price: menu_item[:price])
  file = menu_item[:image]
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:koude_dranken].each do |menu_item|
  f = MenuItem.create(name: menu_item[:name], description: menu_item[:description], category: menu_item[:category], price: menu_item[:price])
  file = menu_item[:image]
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:desserts].each do |menu_item|
  f = MenuItem.create(name: menu_item[:name], description: menu_item[:description], category: menu_item[:category], price: menu_item[:price])
  file = menu_item[:image]
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end
