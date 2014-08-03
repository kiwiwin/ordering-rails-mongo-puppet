class OrdersController < ApplicationController
	before_action :get_user

	def index
		render nothing: true
	end

	private
		def get_user
			@user = User.find(params[:user_id])
		end
end