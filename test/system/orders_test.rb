require 'application_system_test_case'

class OrdersTest < ApplicationSystemTestCase
  setup { @order = orders(:one) }

  test 'visiting the index' do
    visit orders_url
    assert_selector 'h1', text: 'Orders'
  end

  test 'destroying a Order' do
    visit orders_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Order was successfully destroyed'
  end

  test 'check routing number' do
    visit root_url
    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Bob Law'
    fill_in 'order_address', with: '234 Big Law Important Street'
    fill_in 'order_email', with: 'boblawlawblog@blogspot.com'

    assert_no_selector '#order_routing_number'
    select 'Check', from: 'Pay type'
    assert_selector '#order_routing_number'
  end

  test 'credit card number' do
    visit root_url
    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Bob Law'
    fill_in 'order_address', with: '234 Big Law Important Street'
    fill_in 'order_email', with: 'boblawlawblog@blogspot.com'

    assert_no_selector '#order_credit_card_number'
    select 'Credit card', from: 'Pay type'
    assert_selector '#order_credit_card_number'
  end

  test 'po number' do
    visit root_url
    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Bob Law'
    fill_in 'order_address', with: '234 Big Law Important Street'
    fill_in 'order_email', with: 'boblawlawblog@blogspot.com'
    assert_no_selector '#order_po_number'
    select 'Purchase order', from: 'Pay type'
    assert_selector '#order_po_number'
  end
end
