Rails.application.routes.draw do

  get 'order/index'
  get 'order/show'
  get 'order/new'
  get 'order/destroy'
  get 'cart/index'
  get 'cart/show'
  get 'cart/new'
  get 'cart/destroy'
  root 'home#index'
  devise_for :users
  resources :home

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
