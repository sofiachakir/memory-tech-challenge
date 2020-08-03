class OrderProductQuantity < ApplicationRecord
	belongs_to :order 
	belongs_to :product

	def self.create_order_product(params, order, product)
		quantity_params = params.slice('quantity')
		quantity_params.merge!({order: order, product: product})
		quantity = OrderProductQuantity.create(quantity_params)
	end

end
