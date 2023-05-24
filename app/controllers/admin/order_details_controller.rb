class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(order_status: 2) if @order_detail.making_status == "製作中"
      @order_details.each do |order_detail|
        if order_detail.making_status != "製作完了"
          is_updated = false
        end
      end
      @order.update(order_status: 3) if is_updated
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新される。上記のif文でis_updatedがfalseになっている場合、更新されない。
    end
    redirect_to admin_order_path(@order)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
