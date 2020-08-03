class Product < ApplicationRecord
	has_many :order_product_quantities
	has_many :orders, through: :order_product_quantities
end
