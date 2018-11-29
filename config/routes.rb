Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :home, only: [:index, :show], :path => "cat"
  resources :charges
  resources :order, only: [:index, :create]
  resources :cart, only: [:index, :create, :destroy]
  resources :admin, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
