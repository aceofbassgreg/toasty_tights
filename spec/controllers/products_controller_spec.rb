require 'spec_helper'

describe ProductsController do
  describe 'GET #new' do
  	it "creates a new product" do
  	  get :new
      response.should be_success
    end
  end

  describe 'POST #create' do
  	it "creates a new product and saves it" do
  	  expect{
  	  	post :create, product: FactoryGirl.attributes_for(:product)
  	  }.to change(Product, :count).by(1)
  	end
  end

  describe 'DELETE #destroy' do
    before { @product = FactoryGirl.create(:product) }

    it "deletes a product" do
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end
  end
end
