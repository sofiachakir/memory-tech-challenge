require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:each) do 
    @customer = FactoryBot.create(:customer)
  end

  it "has a valid factory" do
    expect(build(:customer)).to be_valid
  end

  context "associations" do

    describe "orders" do
      it { expect(@customer).to have_many(:orders) }
    end

  end
end
