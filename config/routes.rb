# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index'
  get 'store', to: 'store#index'
  resources :products do 
    get :who_bought, on: :member
  end
end
