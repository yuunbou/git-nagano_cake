Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, controller: {
    sessions: 'admins/sessions'
  }
  namespace :admin do
    resources :genres
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
