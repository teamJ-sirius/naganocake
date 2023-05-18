class Public::OrdersController < ApplicationController
  def new
    if current_customer
      cart_items = current_customer.cart_items
      if cart_items.present?
      　@order = Order.new
    　else
        flash[:notice] = "・カートが空です"
        redirect_to request.referer
      end
  　else
      flash[:notice] = "・ログインしてください"
      redirect_to login_path
    end
  end

  def create
　  @order = Order.new(order_params)
　  @order.customer_id = current_customer.id
　  @order.save
　  redirect_to root_path
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
　  @order.save
　  redirect_to 
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :order_status, :post_code, :address, :name, payment_method)
  end
end
