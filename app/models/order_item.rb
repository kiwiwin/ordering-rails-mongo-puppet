class OrderItem
  include MongoMapper::EmbeddedDocument

  embedded_in :order

  key :quantity, Integer
  key :amount, Integer

end
