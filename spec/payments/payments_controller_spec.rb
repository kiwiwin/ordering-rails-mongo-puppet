require 'rails_helper'

describe PaymentsController, :type => :controller do
	render_views
	describe 'GET payment of order' do
		context 'when order already pay' do
			before(:each) do
				@payment = Payment.new(_id: "1", type: "cash", amount: 100)

				@orders = [
					{_id: BSON::ObjectId.from_string('53c28cfa39fb280037000001'), shipping_address: 'tianfu1',
					 phone: '13880660444', payment: @payment}
				]

				@user = User.new({_id: "1", name: "uesr1", contact_address: "chengdu", orders: @orders})

				expect(User).to receive(:find).with("1").and_return(@user).once

				get :show, format: :json, user_id: 1, order_id: '53c28cfa39fb280037000001'
			end

			it 'have http status 200' do
				expect(response.status).to eq(200)
			end

			it 'is JSON format' do
				payment = JSON.parse(response.body)

				expect(payment['type']).to eq("cash")
				expect(payment['amount']).to eq(100)
			end
		end

		context 'when payment not exist' do
			before(:each) do
				@orders = [
					{_id: BSON::ObjectId.from_string('53c28cfa39fb280037000001'), shipping_address: 'tianfu1',
					 phone: '13880660444'}
				]

				@user = User.new({_id: "1", name: "uesr1", contact_address: "chengdu", orders: @orders})

				expect(User).to receive(:find).with("1").and_return(@user).once

				get :show, format: :json, user_id: 1, order_id: '53c28cfa39fb280037000001'
			end

			it 'have http status 404' do
				expect(response.status).to eq(404)
			end
		end
	end


	describe 'POST payment' do
		it 'create success' do
			@order = {_id: BSON::ObjectId.from_string('53c28cfa39fb280037000001'), shipping_address: 'tianfu1',
				 phone: '13880660444'}

			@orders = [
				@order
			]

			@user = User.new({_id: "1", name: "uesr1", contact_address: "chengdu", orders: @orders})

			expect(User).to receive(:find).with("1").and_return(@user).once

	   		post :create, user_id: "1", order_id: '53c28cfa39fb280037000001', payment: { type: 'cash', amount: 100 } 

	   		expect(response).to have_http_status(201)
		end
	end
end