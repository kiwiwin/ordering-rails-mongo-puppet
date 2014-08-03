class User
  include MongoMapper::Document

  many :orders

  key :name, String
  key :contact_address, String

end
