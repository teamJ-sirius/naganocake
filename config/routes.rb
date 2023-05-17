Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  #会員側のルーティング設定
  get 'items' => 'public/items#index'
  #管理者側のルーティング設定
  namespace :admin do
    get 'items' => 'admin/items#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
