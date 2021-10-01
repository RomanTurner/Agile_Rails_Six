# frozen_string_literal: true

# this is the store controller
class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end
end
