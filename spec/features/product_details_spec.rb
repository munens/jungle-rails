require 'rails_helper'

RSpec.feature "Navigate to the product details page", type: :feature, js: true do
  
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

	scenario "Navigate to the product details page" do

		# ACT
		visit root_path

		puts page.html

		# click_link('.actions a .btn.btn-default.pull-right')
		click_on 'Details'

		sleep 3
		save_screenshot

		# puts page.html

		


		expect(page.has_selector?('main section.products-show')).to eq(true)

	end


end
