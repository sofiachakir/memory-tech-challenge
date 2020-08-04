require 'rails_helper'

RSpec.describe OrderProductQuantity, type: :model do
  before(:each) do 
    @order_product_quantity = FactoryBot.create(:order_product_quantity)
  end

  it "has a valid factory" do
    expect(build(:order_product_quantity)).to be_valid
  end

  context "associations" do

    describe "order" do
      it { expect(@order_product_quantity).to belong_to(:order) }
    end

    describe "product" do
      it { expect(@order_product_quantity).to belong_to(:product) }
    end

  end
end
