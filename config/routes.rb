Rails.application.routes.draw do
  namespace :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'

  # 配送先
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]

  # 注文
    resources :orders, only: [:new, :index, :show, :create, :confirm, :complete]

  # カート
    resources :cart_items, only: [:index, :update, :destroy, :create]do
      delete 'destroy_all' => 'cart_items#destroy_all'
    end

  # カスタマー
    resources :customers, only: [:show, :edit, :update]do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end

  # 商品
    resources :itemes, only: [:index, :show]

  end

  devise_for :admins
  devise_for :customers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
