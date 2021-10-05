require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup do 
    @cart = carts(:one)
  end

  test 'can add products to cart' do
    assert_difference('@cart.line_items.count', 1) do
      post line_items_url, params: { product_id: products(:ruby).id, price: products(:ruby).price }
    end 
  end

end
