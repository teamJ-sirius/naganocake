class Public::OrdersController < ApplicationController
  def new
  end

  def index
    @orders = Order.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  def complete
  end
end
