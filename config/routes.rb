Rails.application.routes.draw do
  devise_for :users
  root to: "product_listings#index"
  resources :product_listings do
    resources :purchase_histories, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end