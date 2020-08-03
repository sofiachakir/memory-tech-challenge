# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# Open data file
file = File.open("app/assets/csv/memory-tech-challenge-data.csv", "r")

# Process each line of the file to create objects in db
i = 1
CSV.foreach(file.path, headers: true) do |row|

	puts "Processing row n°#{i}"
	# Convert row to hash
	params = row.to_h

	# Create products
	product = Product.create_product(params)
	puts "> Product : #{product.product_description}"

	# Create countries
	country = Country.create_country(params)
	puts "> Country : #{country.name}"

	# Create customers
	customer = Customer.create_customer(params)
	puts "> Customer : #{customer.id}"
	
	# Create orders
	order = Order.create_order(params, customer, country)
	puts "> Order : #{order.order_id}"
	
	# Create order_product_quantities
	quantity = OrderProductQuantity.create_order_product(params, order, product)
	puts "> Quantity : #{quantity.quantity} products ordered"

	# Increment
	i = i + 1
	break if i==10
end
# Close the file
#file.close
