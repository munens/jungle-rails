class SessionsController < ApplicationController


  def new
  end

  def create
  	@user = User.find_by_email(params[:email])

  	#If user exists and password entered is correct:
  	if @user && @user.authenticate(params[:password])

	  	#If user exists then save the user id inside the borwser cookie
	  	# - so they stay logged in as they move aroud website
	  	session[:user_id] = @user.id
	  	redirect_to :root
	else
		#If user login fails:
    puts "hello Munene"
		render :new
  	end

  end

  def destroy
  	session[:user_id] = nil
	  redirect_to :root
  end


end
