class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'

	def order_email(order, user)
		@order = order
		@user = user
		puts user.inspect
		@email = @user.email
		@url = 'http://example.com/login'
		mail(to: @user.email, subject:'Welcome to this site.' )
	end

end
