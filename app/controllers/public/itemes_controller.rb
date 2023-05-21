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
    params.require(:item).permit(:image, :genre_id, :item_name, :item_description, :price, :sales_status)
  end
end
