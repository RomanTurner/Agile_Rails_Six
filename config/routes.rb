# frozen_string_literal: true

Rails.application.routes.draw do
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  get 'store', to: 'store#index'
  resources :products
end
