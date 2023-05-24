class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
  end
end
