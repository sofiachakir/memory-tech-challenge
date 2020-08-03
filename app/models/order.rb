class Order < ApplicationRecord
	belongs_to :customer
	belongs_to :country
	has_many :order_product_quantities
	has_many :products, through: :order_product_quantities
end
