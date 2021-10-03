# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "the Great Book #{rand(1000)}"
  end

  test 'should get index' do
    get products_url
    assert_response :success
    assert_select 'table' do |element|
      assert_select element, 'tr', minimum: 4
      assert_select element, 'tfoot', 1
      assert_select '.list_image', minimum: 3
      assert_select '.description', minimum: 3
    end
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url,
           params: {
             product: {
               description: @product.description,
               img_url: @product.img_url,
               price: @product.price,
               title: @title,
             },
           }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product),
          params: {
            product: {
              description: @product.description,
              img_url: @product.img_url,
              price: @product.price,
              title: @title,
            },
          }
    assert_redirected_to product_url(@product)
  end

  test 'can not delete product in cart' do
    assert_difference('Product.count', 0) { delete product_url(products(:two)) }
    assert_redirected_to products_url
  end
  test 'should destroy product' do
    assert_difference('Product.count', -1) { delete product_url(@product) }
    assert_redirected_to products_url
  end
end
