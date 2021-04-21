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
    first_name: "De Pits Keuken",
    last_name: "Administrator",
    email: ENV['MAILER_ADDRESS'],
    password: ENV['MAILER_PASSWORD'],
    organization: "De Pits Keuken",
    admin: true
    )
    puts "Admin accout created"
    puts "-----------"

puts "Creating menu items"
menu = YAML.load_file(Rails.root.join("db/assets/menu_items.yml")).deep_symbolize_keys

menu[:warme_gerechten].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:koude_gerechten].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:soepen].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:salades].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:specials].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

menu[:koek_en_taart].each do |menu_item|
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

menu[:warme_dranken].each do |menu_item|
  file = menu_item.delete(:image)
  f = MenuItem.create(menu_item)
  f.price_cents = menu_item[:price] * 100
  f.image.attach(io: File.open(file), filename: "#{f.id}.jpeg", content_type: 'image/jpeg')
  puts "Created menu item #{menu_item[:name]}"
end

puts "-----------"
puts "import complete"