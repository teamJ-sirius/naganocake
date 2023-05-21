class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_items_path
  end

  def show
    @item=Item.find(params[:id])
    @genre=Genre.find(@item.genre_id)
  end

  def edit
  end

  def update
  end

  private
    def item_params
      params.require(:item).permit(:item_name, :item_description, :price, :image, :sales_status, :genre_id)
    end
end
