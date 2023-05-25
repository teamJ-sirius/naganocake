class Public::OrdersController < ApplicationController
  def new
    cart_items = current_customer.cart_items
    if cart_items.present?
      @order = Order.new
      @shipping_addresses = ShippingAddress.all
    else
      flash[:notice] = "カートが空です"
      redirect_to request.referer
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detaile = OrderDetail.new
        @order_detaile.order_id = @order.id
        @order_detaile.item_id = cart_item.item_id
        @order_detaile.quantity = cart_item.quantity
        @order_detaile.order_price = cart_item.item.price * 1.1
        @order_detaile.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      @cart_items = current_customer.cart_items
      flash[:notice] = "〜支払方法、お届け先が不適切です〜"
      redirect_to new_order_path
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @cart_items =  current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      @order.name = "#{current_customer.last_name}" + "#{current_customer.first_name}"
      @order.post_code = current_customer.postcode
      @order.address = current_customer.addresse
    elsif params[:order][:select_address] == "2"
      @order.name = ShippingAddress.find(params[:order][:address_id]).address_name
      @order.post_code = ShippingAddress.find(params[:order][:address_id]).post_code
      @order.address = ShippingAddress.find(params[:order][:address_id]).address
    elsif params[:order][:select_address] == "3"
      @order.name = params[:order][:name]
      @order.post_code = params[:order][:post_code]
      @order.address =params[:order][:address]
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :order_status, :post_code, :address, :name, :payment_method)
  end
end
