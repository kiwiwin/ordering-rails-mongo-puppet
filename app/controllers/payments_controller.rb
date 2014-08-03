class PaymentsController < ApplicationController
	before_action :set_order
	def show
		@payment = @order.payment
		if !@payment
			render nothing: true, status: :not_found
		end
	end

	def create
		@payment = @order.build_payment()
		@payment.save
		render nothing: true, status: :created, location: user_order_payment_url(@user, @order)
	end

	private
		def set_order
			@user = User.find(params[:user_id])
			@order = @user.orders.select { |order| order._id == BSON::ObjectId.from_string(params[:order_id]) }.first
		end
end