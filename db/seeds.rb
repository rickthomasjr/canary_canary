require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

CSV.foreach("db/candy.csv", {:col_sep => "|", :headers => true}) do |csv|
  category = Category.find_or_create_by_name(csv['Category'])
  p = Product.find_or_create_by_code(csv['Code'])
  p.name = csv['Name']
  p.description = csv['Description']
  p.price = csv['Price']
  p.sale_price = csv['Sale Price']
  p.image = csv['Image']
  p.categories << category unless p.categories.include? category
  p.save
  p.piggybak_sellable.destroy if p.piggybak_sellable
  p.create_piggybak_sellable(sku: p.id, description: p.name, active: true, unlimited_inventory: true, price: p.price)
end