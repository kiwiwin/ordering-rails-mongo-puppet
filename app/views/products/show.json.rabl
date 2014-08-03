object @product

attributes :_id, :name, :description, :current_price

node(:uri) { |product| product_url(id: product._id) }