class ReviewsController < ApplicationController

	before_filter :authorize :only [:delete]

	def create
		@product = Product.find params[:product_id]
		@review = Review.new(review_params)
		@user = User.find(session[:user_id])

	
		@review.product = @product
		@review.user = @user

		if @review.save
			puts "saved"
			redirect_to :root
		else

			puts "fail"
			redirect_to :root
		end
	
	end

	def destroy
		@review_delete = Review.find params[:id]
		@review_delete.destroy
		redirect_to :root

	end


	private

	def review_params
		params.require(:review).permit(:description, :rating)
	end

end
