class Public::ItemesController < ApplicationController
  def index
    @items=Item.all

  end

  def show

  end

  private
  def items_params
    params.require(:item).permit(:image,:item_name,:price)
  end
end
