FactoryBot.define do
  factory :order_product_quantity do
  	quantity { 6 }  
    order { FactoryBot.create(:order) }
    product { FactoryBot.create(:product) }
  end
end