require 'rails_helper'

describe OrdersController, :type => :controller do
	render_views

	describe 'GET orders' do
		before(:each) do
			@orders = [
				{_id: BSON::ObjectId.from_string('53c28cfa39fb280037000001'), shipping_address: 'tianfu1', phone: '13880660444'},
				{_id: BSON::ObjectId.from_string('53c28cfa39fb280037000002'), shipping_address: 'tianfu2', phone: '13880660555'}
			]

			@user = User.new({_id: "1", name: "uesr1", contact_address: "chengdu", orders: @orders})

			expect(User).to receive(:find).with("1").and_return(@user).once

			get :index, format: :json, user_id: 1
		end

		it 'have http status 200' do
			expect(response).to have_http_status(200)
		end
	end

end