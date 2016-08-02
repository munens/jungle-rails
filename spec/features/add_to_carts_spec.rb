require 'rails_helper'

RSpec.feature "click on add-to-cart button", type: :feature, js: true do
  
    before :each do

		@category = Category.create! name: 'Apparel'

		1.times do |n|
			@category.products.create!(
				name: Faker::Hipster.sentence(3),
				description: Faker::Hipster.paragraph(3),
				image: open_asset('apparel1.jpg'),
				quantity: 10,
				price: 64.99
			)
		end

	end

	scenario "increase no. of items in cart" do

		# ACT
		visit root_path

		puts page.html

		puts page.has_content?('My Cart (0)')
		# puts page.html

		within('footer.actions') do
			click_link('Add')
		end
		
		sleep 5
		
		puts page.html

		

		# puts page.find('div.container  ul.nav.navbar-nav.navbar-right').inspect

		save_screenshot
		expect(page.has_content?('My Cart (1)')).to be(true)

	end


end
