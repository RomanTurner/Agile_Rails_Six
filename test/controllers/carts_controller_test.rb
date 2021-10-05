require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup { @cart = carts(:one) }

  test 'should create cart' do
    assert_difference('Cart.count') { post carts_url, params: { cart: {} } }

    assert_redirected_to cart_url(Cart.last)
  end

  test 'should show cart' do
    get cart_url(@cart)
    assert_response :redirect
  end


  test 'should update cart' do\
    patch cart_url(@cart), params: { cart: {} }
    assert_redirected_to cart_url(@cart)
  end

  test 'should destroy cart' do
    post line_items_url, params: { product_id: products(:ruby).id }
    @cart = Cart.find(session[:cart_id])

    assert_difference('Cart.count', -1) { delete cart_url(@cart) }

    assert_redirected_to store_index_url
  end
end
