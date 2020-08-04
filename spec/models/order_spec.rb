require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do 
    @order = FactoryBot.create(:order)
  end

  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end

  context "associations" do

    describe "country" do
      it { expect(@order).to belong_to(:country) }
    end

    describe "customer" do
      it { expect(@order).to belong_to(:customer) }
    end

    describe "order_product_quantities" do
      it { expect(@order).to have_many(:order_product_quantities) }
    end

    describe "products" do
      it { expect(@order).to have_many(:products) }
    end

  end

  context "public class methods" do

    describe "self.total_revenue" do
      it "should" do
        # test to write
      end
    end

    describe "self.average_revenue_per_order" do
      it "should return 0 if there is no order" do
        @order.destroy
        expect(Order.average_revenue_per_order).to eq(0)
      end
    end

  end
end
