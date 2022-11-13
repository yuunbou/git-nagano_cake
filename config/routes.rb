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
    patch "/customers/confirm" => "customers#update"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/withdraw" => "customers#withdraw", as: "withdraw"
    resources :items, only:[:index, :show]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :orders, only:[:new, :index, :show, :create]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete", as: "complete"
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get "/" => "homes#top"
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    patch 'order_details/:id' => 'order_details#update'
  end

end
