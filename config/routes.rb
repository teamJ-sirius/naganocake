Rails.application.routes.draw do
  git namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  scope module: :public do
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
      member do
        get :unsubscribe
        patch :withdraw
      end
    end

  # 商品
    resources :itemes, only: [:index, :show]

  end


  namespace :admin do
    root to: 'homes#top'

    # 商品
    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    # ジャンル
    resources :genres, only: [:index, :create, :edit, :update]

    # 顧客情報
    resources :customers, only: [:index, :show, :edit, :update]

    # 注文
    resources :orders, only: [:show, :update]

    # 製作商品
    resources :order_items, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
