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
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
      if @order.update(order_params)
        @order_details.update_all(making_status: 0) if @order.order_status == "入金待ち"
        @order_details.update_all(making_status: 1) if @order.order_status == "入金確認"
      end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
