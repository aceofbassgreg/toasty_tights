require 'spec_helper'

describe ProductsController do
  describe 'GET #new' do
  	it "creates a new product" do
  	  get :new
      response.should be_redirect
    end
  end

  describe 'POST #create' do
  	it "creates a new product and saves it" do
  	  expect{
  	  	post :create, product: FactoryGirl.attributes_for(:product)
  	  }.to change(Product, :count).by(1)
  	end
  end
end
