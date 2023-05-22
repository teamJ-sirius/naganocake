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
    @order.save
　  redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  def confirm
    # @cart_items =  current_customer.cart_items
    # @order = Order.new(order_params)
    # if params[:order][:select_address] == "1"
    #   @order.name = "#{current_customer.last_name}" + "#{current_customer.first_name}"
    #   @order.post_code = current_customer.postcode
    # 　  @order.address = current_customer_addresse
    # elseif params[:order][:select_address] == "2"
    #   @order.name = ShippingAddress.find(params[:order][:address_id]).last_name + first_name
    #   @order.post_code = ShippingAddress.find(params[:order][:address_id]).postcode
    #   @order.address = ShippingAddress.find(params[:order][:address_id]).addresse
    # elseif params[:order][:select_address] == "3"
    #   @order.name = params[:order][:last_name + first_name]
    #   @order.post_code = params[:order][:postcode]
    # 　  @order.address =params[:order][:address]
    # end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :order_status, :post_code, :address, :name, :payment_method)
  end
end
