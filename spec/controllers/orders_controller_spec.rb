require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before :each do
    @order = FactoryBot.create(:order)
  end

  describe "GET #index" do
    it "assigns @orders" do
      # on va sur index
      get :index

      # @orders doit être un array qui contient order
      expect(assigns(:orders)).to eq([@order])
    end

    it "renders the index template" do
      # va sur index
      get :index

      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end

end