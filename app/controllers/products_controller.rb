class ProductsController < ApplicationController
	def index
		@products = Product.all
		render nothing: true
	end
end