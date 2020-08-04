class OrdersController < ApplicationController
  def index
  	@countries = Country.all.map{|c| [c.name, c.id] }.unshift(['All', 0])
  	@orders = Order.all
  	@orders = @orders.filter_by_country(params[:country]) if params[:country].present?
  	@selected_country = Country.find(params[:country]) if params[:country].present?
  	@data = @orders.revenue_per_month
  end
end
