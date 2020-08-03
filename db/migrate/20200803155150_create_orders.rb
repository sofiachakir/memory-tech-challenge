class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :date
      t.string :order_id
      t.belongs_to :customer, index: true
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
