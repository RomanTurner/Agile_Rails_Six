xml.instruct!
xml.product do
  xml.title @product.title
  xml.description @product.description
  xml.orders do
    @product.orders.each do |order|
      xml.order_id order.id
      xml.address order.address

      xml.items do
        order.line_items.each do |item|
          xml.product item.product.title
          xml.quantity item.quantity
          xml.price number_to_currency item.total_price
        end
      end
      xml.total_sale number_to_currency order.line_items.map(&:total_price).sum
      xml.payment_type order.pay_type
      xml.customer order.name
      xml.customer_email order.email
    end
  end
end
