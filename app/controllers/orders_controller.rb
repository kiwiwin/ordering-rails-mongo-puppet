class OrdersController < ApplicationController
	before_action :get_user

	def index
		@orders = @user.orders
	end

	def show
		@order = @user.orders.select { |order| order._id == BSON::ObjectId.from_string(params[:id]) }.first
		if !@order
			render nothing: true, status: :not_found
		end
	end

	def create
		@order = @user.orders.build(shipping_address: params[:order])

		render nothing: true, status: :created
	end	

	private
		def get_user
			@user = User.find(params[:user_id])
		end
end