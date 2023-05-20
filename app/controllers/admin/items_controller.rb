class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def item_params
      params.require(:item).permit(:item_name, :item_description, :price, :images, :sales_status)
    end
end
