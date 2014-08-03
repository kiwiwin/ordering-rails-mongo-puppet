class Payment
  include MongoMapper::Document

  belongs_to :order

  key :type, String
  key :amount, Integer

end
