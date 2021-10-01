class Product < ApplicationRecord
  validates :title, :description, :img_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :img_url,
            allow_blank: true,
            format: {
              with: /\.(gif|jpg|png)\Z/i,
              message: 'must be a URL for GIF, JPG, PNG image',
            }
end
