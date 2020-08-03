class CreateOrderProductQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :order_product_quantities do |t|
    	t.belongs_to :order, index: true
    	t.belongs_to :product, index: true
    	t.integer :quantity

      t.timestamps
    end
  end
end
