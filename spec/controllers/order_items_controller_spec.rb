require 'spec_helper'

describe OrderItemsController do

  describe 'GET #new' do
  	it "creates a new order item" do
  	  get :new
      response.should be_success
    end
  end

  # describe 'GET #index' do
  #   it "lists the products in the order item" 
  # end
      

  describe 'POST #create' do
    before { product = FactoryGirl.create(:product) }

    it "stores items in the cart" do 
      expect{
        post :create, order_item: FactoryGirl.attributes_for(:order_item)
      }.to change(OrderItem, :count).by(1)
    end
  end
    

  describe 'DELETE destroy' do
  	before { @order_item = FactoryGirl.create(:order_item) }
  	  
  	it "deletes the order item" do 
      expect{
        delete :destroy, id: @order_item   
      }.to change(OrderItem, :count).by(-1)
    end
  end
end
