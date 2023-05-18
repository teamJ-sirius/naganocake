class Public::ItemesController < ApplicationController
  def index
    @items=Item.all

  end

  def show
    @cart_item = CartItem.new
  end

  private
  def items_params
    params.require(:item).permit(:image,:item_name,:price)
  end
end
