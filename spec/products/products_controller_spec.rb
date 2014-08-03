require 'rails_helper'

describe ProductsController, :type => :controller do
	render_views

	describe 'GET products' do
		before(:each) do
			@products = [
	         	Product.new({:_id => 1, :name => 'apple juice', :description => 'good', current_price: 100}),
	         	Product.new({:_id => 2, :name => 'banana juice', :description => 'just so so', current_price: 200})
			]

			expect(Product).to receive(:all).and_return(@products).once

			get :index, format: :json
		end

		it 'have http status 200' do
			expect(response).to have_http_status(200)
		end


		it 'is JSON format' do
			products = JSON.parse(response.body)

			expect(products.length).to eq(2)
		end
	end

	describe 'GET product' do
		context 'when product exist' do
			before(:each) do
				@product = Product.new({:_id => 1, :name => 'apple juice', :description => 'good', current_price: 100})

				expect(Product).to receive(:find).with("1").and_return(@product).once

				get :show, format: :json, id: 1
			end

			it 'have http status 200' do
				expect(response).to have_http_status(200)
			end

			it 'is JSON format' do
				product = JSON.parse(response.body)

				expect(product['_id']).to eq(1)
				expect(product['name']).to eq('apple juice')
				expect(product['description']).to eq('good')
				expect(product['current_price']).to eq(100)
			end
		end

	end

end

