require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup { @cart = carts(:one) }
  test '#total_price' do
   assert_equal(50, @cart.total_price)
  end
end
