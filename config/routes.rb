Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :customers

  namespace :public do
    root 'homes#top'
    get '/about' => 'homes#about'

  # 配送先
    resources :shipping_addresses

  # 注文
    resources :orders, only: [:new, :index, :show, :create]do
      member do
        post :confirm
        get :complete
      end
    end

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
