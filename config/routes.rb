Rails.application.routes.draw do
  devise_for :users
  resources :storages do
    resources :products
  end

  resources :users
  resources :product_types
  root 'home#index'
  get 'search/:storage_id' => 'search#index', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
