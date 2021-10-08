json.product do
  json.title @product.title
  json.description @product.description
 json.orders @product.orders.each do |order|
      json.order_id order.id
      json.address order.address

      json.items order.line_items.each do |item|
          json.product item.product.title
          json.quantity item.quantity
          json.price number_to_currency item.total_price
      end

    json.total_sale number_to_currency order.line_items.map(&:total_price).sum
    json.payment_type order.pay_type
    json.customer order.name
    json.customer_email order.email
  end
end
