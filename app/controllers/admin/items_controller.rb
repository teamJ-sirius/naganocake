class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    if Genre.count.zero?
      flash[:alert] = "先にジャンルを追加してください"
      redirect_to admin_genres_path
    else
      @item = Item.new
    end
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item=Item.find(params[:id])
    @genre=Genre.find(@item.genre_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private
    def item_params
      params.require(:item).permit(:item_name, :item_description, :price, :image, :sales_status, :genre_id)
    end
end
