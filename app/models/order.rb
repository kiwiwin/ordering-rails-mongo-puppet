class Order
  include MongoMapper::EmbeddedDocument

  embedded_in :user
  many :order_items

  key :shipping_address, String
  key :phone, String

end
