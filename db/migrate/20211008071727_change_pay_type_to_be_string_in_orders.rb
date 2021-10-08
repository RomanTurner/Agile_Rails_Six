class ChangePayTypeToBeStringInOrders < ActiveRecord::Migration[6.1]
  def up
    change_column :orders, :pay_type, :string
    map = { "0" => 'Check', "1" => 'Credit card', "2" => 'Purchase Order' }
    Order.all.each do |order|
    order.pay_type = map[order.pay_type]
    order.save
    end
  end
  def down
    change_column :orders, :pay_type, :integer
    map = {'Check' => "0", 'Credit card' => "1", 'Purchase Order' => "2"}
    Order.all.each do |order|
    order.pay_type = map[order.pay_type]
    order.save
    end
  end
end
