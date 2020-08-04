require 'rails_helper'

RSpec.describe Country, type: :model do
  before(:each) do 
    @country = FactoryBot.create(:country)
  end

  it "has a valid factory" do
    expect(build(:country)).to be_valid
  end

  context "associations" do

    describe "orders" do
      it { expect(@country).to have_many(:orders) }
    end

  end
end
