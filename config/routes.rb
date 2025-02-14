Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :products, only: [:index, :show]

  resources :orders, only: [:index, :show, :create, :update] do
    resources :order_items, only: [:create, :update, :destroy] # Ajout d'articles à une commande
  end

  resources :carts, only: [:show] do
    post "add_product/:product_id", to: "carts#add_product", as: :add_product
    delete "remove_product/:product_id", to: "carts#remove_product", as: :remove_product
  end

  resources :wishlists, only: [:index, :create, :destroy]
end
