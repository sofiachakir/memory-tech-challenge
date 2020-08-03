class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :product_description
      t.float :unit_price

      t.timestamps
    end
  end
end
