class Product
  include MongoMapper::Document

  belongs_to :order_item

  key :name, String
  key :description, String
  key :current_price, Integer

end
