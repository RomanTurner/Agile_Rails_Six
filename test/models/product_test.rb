require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:img_url].any?
  end
  test 'the price must be positive' do
    product =
      Product.new(
        title: 'My Book Title',
        description: 'yyy',
        img_url: 'zzz.jpg',
      )
    product.price = -1
    assert product.invalid?
    product.price = 0
    assert product.invalid?
    product.price = 1
    assert product.valid?
  end

  def new_product(img_url)
    product =
      Product.new(
        title: 'My Book Title',
        description: 'yyy',
        price: 1,
        img_url: img_url,
      )
  end
  test 'the img must have a valid file format' do
    ok = %w[
      fred.gif
      fred.jpg
      fred.png
      FRED.JPG
      FRED.Jpg
      http://a.a.a.cll//fred.gif
    ]
    bad = %w[fred.doc fred.pdf fred.gif/more fred.gif.more fred.xldrip]
    ok.each do |img_url|
      assert new_product(img_url).valid?, "#{img_url} shouldn't be invalid"
    end
    bad.each do |img_url|
      assert new_product(img_url).invalid?, "#{img_url} shouldn't be valid"
    end
  end
  test 'product is not valid without a unique title' do
    product =
      Product.new(
        title: products(:ruby).title,
        description: 'lll',
        price: 1,
        img_url: 'chung.png',
      )
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end
end
