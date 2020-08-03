class Customer < ApplicationRecord
	has_many :orders

	def self.create_customer(params)
		customer_params = params.slice('customer_id')
		customer = Customer.find_by(customer_params)
		customer ? customer : Customer.create(customer_params)
	end
end
