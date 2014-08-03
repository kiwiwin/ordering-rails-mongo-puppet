class Order
  include MongoMapper::EmbeddedDocument

  embedded_in :user
  many :order_items
  one :payment

  key :shipping_address, String
  key :phone, String

  def total_amount
  	order_items.inject(0) { |sum, order_item| sum + order_item.amount }
  end

end
