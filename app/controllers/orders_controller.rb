class OrdersController < ApplicationController
	before_action :get_user

	def index
		@orders = @user.orders
	end

	def show
		@order = @user.orders.select { |order| order._id == BSON::ObjectId.from_string(params[:id]) }.first
		render nothing: true
	end

	private
		def get_user
			@user = User.find(params[:user_id])
		end
end