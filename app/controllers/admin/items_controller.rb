class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    # ジャンルが空なら先にジャンル登録を促しジャンル追加画面へ
    if Genre.count.zero?
      flash[:alert] = "先にジャンルを追加してください"
      redirect_to admin_genres_path
    # ジャンルが登録されていれば商品新規登録画面へ
    else
      @item = Item.new
    end
  end

  def create
    @item = Item.new(item_params)
    # 商品が登録されればメッセージを表示し商品一覧ページへ遷移
    if @item.save
      flash[:notice] = "商品の登録が完了しました"
      redirect_to admin_items_path
    # 商品の登録が失敗すればエラーメッセージを表示し再度商品の新規登録画面を表示
    else
      flash[:alert] = "商品の登録に失敗しました"
      redirect_to new_admin_item_path
    end
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
    # 情報更新が成功すればメッセージを表示し商品一覧ページへ遷移
    if @item.update(item_params)
      flash[:notice] = "商品情報の更新が完了しました"
      redirect_to admin_items_path
    # 情報更新が失敗すればエラーメッセージを表示し再度商品情報編集画面を表示
    else
      flash[:alert] = "商品情報の更新に失敗しました"
      redirect_to edit_admin_item_path
    end
  end

  private
    def item_params
      params.require(:item).permit(:item_name, :item_description, :price, :image, :sales_status, :genre_id)
    end
end
