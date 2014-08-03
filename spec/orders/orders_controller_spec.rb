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

		it 'is JSON format' do
			orders = JSON.parse(response.body)

			expect(orders.length).to eq(2)

			order = orders[0]

			expect(order['_id']).to eq('53c28cfa39fb280037000001')
			expect(order['shipping_address']).to eq('tianfu1')
			expect(order['phone']).to eq('13880660444')
		end
	end

	describe 'GET order' do
		context 'when order exist' do
			before(:each) do
				@orders = [
					{_id: BSON::ObjectId.from_string('53c28cfa39fb280037000001'), shipping_address: 'tianfu1', phone: '13880660444', 
					order_items: [
						{
							product: {
								_id: '53c28cfa39fb280037000003',
								name: 'apple juice',
								current_price: 300
							},
							quantity: 2,
							amount: 600
						}
					]}
				]

				@user = User.new({_id: "1", name: "uesr1", contact_address: "chengdu", orders: @orders})

				expect(User).to receive(:find).with("1").and_return(@user).once

				get :show, format: :json, user_id: 1, id: '53c28cfa39fb280037000001'
			end

			it 'have http status 200' do
				expect(response).to have_http_status(200)
			end

			it 'is JSON format' do
				order = JSON.parse(response.body)

				expect(order['_id']).to eq('53c28cfa39fb280037000001')
				expect(order['shipping_address']).to eq('tianfu1')
				expect(order['phone']).to eq('13880660444')
				expect(order['order_items'].length).to eq(1)

				expect(order['uri']).to end_with('/users/1/orders/53c28cfa39fb280037000001')
			end
		end

		context 'when order not exist' do
			before(:each) do
				@orders = [
				]

				@user = User.new({_id: "1", name: "uesr1", contact_address: "chengdu", orders: @orders})

				expect(User).to receive(:find).with("1").and_return(@user).once

				get :show, format: :json, user_id: 1, id: '53c28cfa39fb280037000001'
			end

			it 'have http status 404' do
				expect(response).to have_http_status(404)
			end
		end
	end

end