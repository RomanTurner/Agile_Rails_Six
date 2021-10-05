require 'test_helper'
class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup { @line_item = line_items(:one) }

  test 'should get index' do
    get line_items_url
    assert_response :redirect
  end

  test 'should create line_item' do 
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id, price: products(:ruby).price }
    end

    follow_redirect!

    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'td', 'Programming Ruby 1.9'
  end

  test 'should show line_item' do
    get line_item_url(@line_item)
    assert_redirected_to product_path(@line_item.product_id)
  end

  test 'should get edit' do
    get line_item_url(@line_item)
    assert_response :redirect
  end

  test 'should update line_item' do
    patch line_item_url(@line_item),
          params: {
            line_item: {
              product_id: @line_item.product_id,
            },
          }
    assert_redirected_to line_item_url(@line_item)
  end

  test 'should destroy line_item' do
    assert_difference('LineItem.count', -1) { delete line_item_url(@line_item) }

    assert_response :redirect
  end
end
