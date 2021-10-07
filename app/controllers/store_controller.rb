# frozen_string_literal: true

# this is the store controller
class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
    flash[:counter]
    @products = Product.order(:title)
  end
end
