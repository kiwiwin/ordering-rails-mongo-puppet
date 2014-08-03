class Product
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :current_price, Integer

end
