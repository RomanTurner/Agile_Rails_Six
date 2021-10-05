class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  def total_price
    self.price * self.quantity
  end
end
