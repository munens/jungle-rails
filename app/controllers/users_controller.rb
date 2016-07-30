gem 'bcrypt', '~> 3.1.7'

class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create
		
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to :root, notice: 'New user created!'
		else
			render :new
		end
	end

	def show 

	end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end


end