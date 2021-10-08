require 'application_system_test_case'

class StoresTest < ApplicationSystemTestCase
  test 'visiting the store for the first time' do
    visit root_url
    assert_no_selector '#cart'
    assert_selector 'h1', text: 'Your Pragmatic Catalog'
  end

  test 'Add to Cart buttons reveal the cart' do
    visit root_url
    assert_selector('#cart', visible: false)
    click_on 'Add to Cart', match: :first
    assert_selector('#cart', visible: true)
  end

  test 'Empty cart button hide cart' do
    visit root_url
    click_on 'Add to Cart', match: :first
    page.accept_confirm { click_on 'Empty cart' }
    assert_selector('#cart', visible: false)
  end

  test 'Highlighting feature' do
     visit root_url 
     assert_no_selector '.line-item-highlight'
     click_on 'Add to Cart', match: :first 
     assert_selector '.line-item-highlight'
  end

end
