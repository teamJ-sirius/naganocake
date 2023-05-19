class Public::OrdersController < ApplicationController
  def new
  end

  def create
　 
  end

  def index
    @orders = Order.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  def confirm
    
  end

  def complete
  end

  private

  def order_params
  end
end
