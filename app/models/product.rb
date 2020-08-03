class Product < ApplicationRecord
	has_many :order_product_quantities
	has_many :orders, through: :order_product_quantities

	def self.create_product(params)
		product_params = params.slice('product_code', 'product_description', 'unit_price')
		product = Product.find_by(product_code: params['product_code'])
		product ? product : Product.create(product_params)
	end
end
