object @order

attributes :_id, :shipping_address, :phone

node(:uri) { |order|  user_order_url(user_id: order.user._id, id: order._id) }