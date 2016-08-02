require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
  	@user = User.new
  end

  describe "Validations" do

  	it "should have the same password" do
  		@user.first_name = "Julio"
  		@user.last_name = "Badalangi"
  		@user.password = "julio"
  		@user.password_confirmation = "julio"

  		expect(@user.password).to eq(@user.password_confirmation)
    end
  	
    it "should not have the same password" do
  		@user.first_name = "Julio"
  		@user.last_name = "Badalangi"
  		@user.password = "julio1"
  		@user.password_confirmation = "julio"

  		expect(@user.password).not_to eq(@user.password_confirmation)
    end

    it "emails are unique" do

    	@user1 = User.new
    	@user1.first_name = "Josiah"
    	@user1.last_name = "kiganjo"
    	@user1.email = "kiganjo@africaonline.co.ke"
    	@password = "passwords"

    	@user2 = User.new
    	@user2.first_name = "Joseph"
    	@user2.last_name = "Blair"
    	@user2.email = "kiganjo@africaonline.co.ke"
    	@password = "passwords1"

	   	expect(@user1.valid?).to eq(false)
	    
	end


	it "password length too short" do

    	@user3 = User.new
    	@user3.first_name = "Joseph"
    	@user3.last_name = "Blair"
    	@user3.email = "kiganjo@africaonline.co.ke"
    	@user3.password = "passwor"

		expect(@user3.valid?).to eq(false)
	end

	it "first name" do
		@user.first_name = "Jacob"
		expect(@user.first_name).to be_truthy
	end

	it "last name" do
    	@user.last_name = "Corn"
		expect(@user.last_name).to be_truthy
	end

	it "email" do
    	@user.email = "kisimba@gmail.com"
    	expect(@user.email).to be_truthy
	end


  end


  describe '.authenticate_with_credentials' do
	
	it "with correct authentication" do
		@user = User.new

		@user.first_name = 'James'
	  	@user.last_name = 'Blake'
	  	@user.email = 'kaumbuthom@yahoo.com'
	  	@user.password = 'password1'
	  	@user.save!

	  	expect(User.authenticate_with_credentials('kaumbuthom@yahoo.com', 'password1')).to be_truthy
  
  	end

	it "with incorrect authentication" do
		@user = User.new
	  	expect(User.authenticate_with_credentials('kaumbuthom@yahoo.com', 'passwoffkd1')).to be_nil
  	end

  	it "with white space at beginning" do 

  		@user = User.new

		@user.first_name = 'James'
	  	@user.last_name = 'Blake'
	  	@user.email = 'kaumbuthom@yahoo.com'
	  	@user.password = 'password1'
	  	@user.save!

	  	expect(User.authenticate_with_credentials(' kaumbuthom@yahoo.com', 'password1')).to be_truthy
  
  	end
  	
  	it "with white space at ending" do 
  		@user = User.new

		@user.first_name = 'James'
	  	@user.last_name = 'Blake'
	  	@user.email = 'kaumbuthom@yahoo.com'
	  	@user.password = 'password1'
	  	@user.save!

	  	expect(User.authenticate_with_credentials('kaumbuthom@yahoo.com ', 'password1')).to be_truthy
  

  	end

  	it "with white space at beginning and end" do 
  		@user = User.new

		@user.first_name = 'James'
	  	@user.last_name = 'Blake'
	  	@user.email = 'kaumbuthom@yahoo.com'
	  	@user.password = 'password1'
	  	@user.save!

	  	expect(User.authenticate_with_credentials(' kaumbuthom@yahoo.com ', 'password1')).to be_truthy
  
  	end


  	it "with upper case and lower case letters and white space on both ends" do 
  		@user = User.new

		@user.first_name = 'James'
	  	@user.last_name = 'Blake'
	  	@user.email = 'kaumbuthom@yahoo.com'
	  	@user.password = 'password1'
	  	@user.save!

	  	expect(User.authenticate_with_credentials(' kaUMbuThoM@yahoo.com ', 'password1')).to be_truthy
  
  	end

  end	

end
