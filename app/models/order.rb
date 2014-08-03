class Order
  include MongoMapper::EmbeddedDocument

  embedded_in :user

  key :shipping_address, String
  key :phone, String

end
