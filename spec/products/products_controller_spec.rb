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
	end

end

