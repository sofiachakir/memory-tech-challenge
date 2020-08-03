class Order < ApplicationRecord
	belongs_to :customer
	belongs_to :country
	has_many :order_product_quantities
	has_many :products, through: :order_product_quantities

	def self.create_order(params, customer, country)
		order_params = params.slice('order_id', 'date')
		order_params.merge!({customer: customer, country: country})
		order = Order.find_by(order_id: params['order_id'])
		order ? order : Order.create(order_params)
	end
end
