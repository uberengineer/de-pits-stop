Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menu_items , only: [:index, :show, :new, :create]
  resources :orders, only: [:show, :update, :index] do
    member do
      resources :order_items, only: [:create, :destroy]
      get "/orders/:id/checkout", to: "orders#checkout", as: "checkout"
    end
  end
end
