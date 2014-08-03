object @order

attributes :_id, :shipping_address, :phone, :total_amount

node(:uri) { |order|  user_order_url(user_id: order.user._id, id: order._id) }

child(:order_items) {
	extends 'order_items/show'
}