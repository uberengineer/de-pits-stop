# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "starting the seeds"
MenuItem.destroy_all
Order.destroy_all
User.destroy_all


puts "creating users "
4.times do |num|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "george#{num}@gmail.com",
    password: "123456",
    admin: true)

  end
puts "#{User.count} user's created"


puts "-----------"
puts "creating menu items"
menu = YAML.load_file(Rails.root.join("db/assets/menu_items.yml")).deep_symbolize_keys


menu[:daily_special].each do |menu_item|
  MenuItem.create(name: menu_item[:name])
end

menu[:combi_deals].each do |menu_item|
  MenuItem.create(name: menu_item[:name])
end

menu[:losse_items].each do |menu_item|
  MenuItem.create(name: menu_item[:name])
end

menu[:extras].each do |menu_item|
  MenuItem.create(name: menu_item[:name])
end

menu[:koude_dranken].each do |menu_item|
  MenuItem.create(name: menu_item[:name])
end

puts "#{MenuItem.count} menu item created"
puts"end of seeds"
