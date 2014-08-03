class Payment
  include MongoMapper::EmbeddedDocument

  belongs_to :order

  key :type, String
  key :amount, Integer

end
