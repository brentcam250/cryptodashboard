Rails.application.routes.draw do
  resources :cryptocurrencies, only: [:index, :show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :follows, only: [:new, :create]

  root 'cryptocurrencies#index'
end
