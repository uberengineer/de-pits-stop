# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

menu = YAML.load_file(Rails.root.join("db/assets/menu_items.yml")).deep_symbolize_keys
MenuItem.destroy_all
puts "We're starting to create menu items"

menu[:daily_special].each do |menu_item|
  puts "Created menu item #{menu_item[:name]}"
  MenuItem.create(name: menu_item[:name])
end

menu[:combi_deals].each do |menu_item|
  puts "Created menu item #{menu_item[:name]}"
  MenuItem.create(name: menu_item[:name])
end

menu[:losse_items].each do |menu_item|
  puts "Created menu item #{menu_item[:name]}"
  MenuItem.create(name: menu_item[:name])
end

menu[:extras].each do |menu_item|
  puts "Created menu item #{menu_item[:name]}"
  MenuItem.create(name: menu_item[:name])
end

menu[:koude_dranken].each do |menu_item|
  puts "Created menu item #{menu_item[:name]}"
  MenuItem.create(name: menu_item[:name])
end