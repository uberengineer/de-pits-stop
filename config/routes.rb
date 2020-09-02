Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menu_items , only: [:index, :show, :new, :create]
  get "/past_orders", to: "orders#past_orders", as: "past_orders"
  get "/show_current_orders", to: "orders#show_current_orders", as: "show_current_orders"
  resources :orders, only: [:show, :update, :index] do
    member do
      resources :order_items, only: [:create, :destroy]
      get "/checkout", to: "orders#checkout", as: "checkout"
    end
  end
end

