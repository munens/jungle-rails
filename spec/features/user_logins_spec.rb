require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
	
	before :each do
		@user_1 = User.create!(first_name: 'James', last_name: 'Blake', email: 'blake@uguy.org', password: 'blackandrich')
		@user_2 = User.new

		@category = Category.create! name: 'Apparel'

		1.times do |n|
			@category.products.create!(
				name: Faker::Hipster.sentence(3),
				description: Faker::Hipster.paragraph(3),
				image: open_asset('apparel1.jpg'),
				quantity: 10,
				price: 64.99)
		end

	end	

	scenario 'Attempt to login a user' do
		puts @user_2.inspect
		visit new_session_path

		@user_2.first_name = 'Munene' 
		@user_2.last_name = 'Kaumbutho'
		@user_2.email = 'kaumbuthom@yahoo.com'
		@user_2.password = 'pass'

		@user_2.save

		puts page.html

		

			fill_in 'email', :with => 'blake@uguy.org'
			fill_in 'password', :with => 'blackandrich'

			click_button 'Submit'		

		
		puts "afffffffffffffffffttttteeeeeeeeerrrrrrrrrr"
		puts page.html

		expect(page.has_selector?('main section.products-index')).to eq(true)

	end

end
