class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    # ジャンルの追加に成功した場合、メッセージを表示しジャンル一覧画面へ
    if @genre.save
      flash[:notice] = "ジャンルの追加が完了しました"
      redirect_to admin_genres_path
    # ジャンルの追加に失敗した場合、エラーメッセージを表示しジャンル一覧画面へ
    else
      flash[:alert] = "ジャンルの追加に失敗しました"
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    # ジャンルの更新に成功した場合、メッセージを表示しジャンル一覧画面へ
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの更新が完了しました"
      redirect_to admin_genres_path
    # ジャンルの更新に失敗した場合、エラーメッセージを表示しジャンル一覧画面へ
    else
      flash[:alert] = "ジャンルの更新に失敗しました"
      redirect_to edit_admin_genre_path
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
