class Public::OrdersController < ApplicationController
  def new
    cart_items = current_customer.cart_items
    if cart_items.present?
      @order = Order.new
      @shipping_addresses = ShippingAddress.all
    else
      flash[:notice] = "・カートが空です"
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
　 
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
