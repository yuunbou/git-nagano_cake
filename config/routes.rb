Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about", as: "about"
    get "/customers/my_page" => "customers#show"
    get "/customers/information/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/withdraw" => "customers#withdraw", as: "withdraw"
    resources :items, only:[:index, :show]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only:[:index, :update, :destroy, :create]
    get "/orders/new" => "orders#new"
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete", as: "complete"
    resources :orders, only:[:index, :show, :create]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get "/" => "homes#top"
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end

end
