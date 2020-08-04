class Order < ApplicationRecord
	scope :filter_by_country, -> (country) { where(country: country) }

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

	def self.total_revenue
		# Revenue in €
		Order.joins(:products).pluck(:quantity, :unit_price).map{ |q, p| q*p }.sum.round(1)
	end

	def self.total_revenue_in_billions
		(Order.total_revenue / (10 ** 6)).round(1)
	end

	def self.total_revenue_in_thousands
		(Order.total_revenue / (10 ** 3)).round(1)
	end

	def self.average_revenue_per_order
		# Revenue in €
		order_count = Order.count
		order_count > 0 ? (Order.total_revenue / order_count).round(1) : 0
	end

	def self.distinct_customers
		Order.joins(:customer).distinct.count(:customer_id)
	end

	def self.distinct_customers_in_thousands
		(Order.distinct_customers / 1000).round
	end
end
