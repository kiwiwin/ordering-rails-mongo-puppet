class PaymentsController < ApplicationController
	before_action :set_order
	def show
		@payment = @order.payment
	end

	private
		def set_order
			@user = User.find(params[:user_id])
			@order = @user.orders.select { |order| order._id == BSON::ObjectId.from_string(params[:order_id]) }.first
		end
end