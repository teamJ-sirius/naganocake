class Public::ItemesController < ApplicationController
  def index
    @items=Item.all

  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end

  private
  def items_params
    params.require(:item).permit(:image,:item_name,:price, :genre_id, :item_description, :sales_status)
  end
end
