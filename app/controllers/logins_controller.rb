class LoginsController < ApplicationController


	def create
		if(user = User.authenticate_with_credentials(params[:email], params[:password]))

			session[:user_id] = user.id
			redirect_to :root, notice: 'New user created!'
		else
			redirect_to :login
		end
	end
	
			
end
