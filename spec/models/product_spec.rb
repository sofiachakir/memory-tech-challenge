require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do 
    @product = FactoryBot.create(:product)
  end

  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  context "associations" do

    describe "order_product_quantities" do
      it { expect(@product).to have_many(:order_product_quantities) }
    end

    describe "orders" do
      it { expect(@product).to have_many(:orders) }
    end

  end
end
