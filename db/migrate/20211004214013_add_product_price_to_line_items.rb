class AddProductPriceToLineItems < ActiveRecord::Migration[6.1]
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |line_item|
      line_item.update_attribute :price, line_item.product.price
    end
  end
  def down
    remove_column :line_items, :price
  end
end
