class ProductsController < ApplicationController
	rescue_from MongoMapper::DocumentNotFound, with: :product_not_found

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	private
		def product_not_found
			render nothing: true, status: :not_found
		end
end