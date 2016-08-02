require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

# SETUP:
before :each do

	@category = Category.create! name: 'Apparel'

	10.times do |n|
		@category.products.create!(
			name: Faker::Hipster.sentence(3),
			description: Faker::Hipster.paragraph(3),
			image: open_asset('apparel1.jpg'),
			quantity: 10,
			price: 64.99
		)
	end

end

# Here, - a feature block is the same as a describe block
#       - a scenario block is the same as a it block.
	scenario "They see all products" do
		# ACT
		visit root_path

		# DEBUG/ VERIFY
		save_screenshot

		expect(page).to have_css 'article.product', count: 10
	end

end

