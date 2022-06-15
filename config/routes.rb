Rails.application.routes.draw do
  devise_for :users
  root to: "product_listings#index"
  resources :product_listings, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end