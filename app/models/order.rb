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

	def revenue
		res = self.order_product_quantities.joins(:product).pluck(:quantity, :unit_price)
		res.map{|q, up| q * up}.sum
	end

	def self.total_revenue
		# Revenue in €
		Order.all.map{ |o| o.revenue }.sum
	end

	def self.total_revenue_in_billions
		(Order.total_revenue / (10 ** 6)).round(1)
	end

	def self.average_revenue_per_order
		# Revenue in €
		order_count = Order.count
		order_count ? (Order.total_revenue / order_count) : 0
	end

	def self.distinct_customers
		Order.joins(:customer).distinct.count(:customer_id)
	end

	def self.distinct_customers_in_thousands
		(Order.distinct_customers / 1000).round
	end
end
