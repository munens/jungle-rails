require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

  	before :each do 
  		@category = Category.create!(name: 'Apparel')
  		@product = Product.new
  		# @product = Product.create!(name: "Black futuristic sandals", price: 5567, quantity: 23, category: @category)
  	end

  	it "name" do
  		@product.name = "Black futuristic sandals"
  		expect(@product.name).to be_truthy

  	end

  	it "price" do
  		@product.price_cents = 397.64
  		expect(@product.price_cents).to be_truthy

  	end


  	it "quantity" do
  		@product.quantity = 23
  		expect(@product.quantity).to be_truthy

  	end


  	it "category" do
  		@product.category = @category
  		expect(@product.category.valid?).to be_truthy

  	end


  	it "price" do
  		@product.price_cents = nil

  		@product.inspect

  		# @product.name = "Black futuristic sandals"
  		# @product.price = nil
  		
  		expect(@product.valid?).to be_falsey

  		expect(@product.errors[:price_cents].size).to eq(1)
  		@product.errors.full_messages
  		#puts expect(@product.errors[:price]).to eql['is not included in the list']

  	end

  end
end
