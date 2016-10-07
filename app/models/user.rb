class User < ActiveRecord::Base

  has_secure_password

  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password_digest, length: {minimum: 8}

  def self.authenticate_with_credentials(email, password)
  	
  	#User.find_by(email: email, password: password)
  	
  	@user = User.find_by_email(email.squish.downcase)

  	#If user exists and password entered is correct:
  	if @user && @user.authenticate(password)
  		@user
  	else
  		nil
	end	  	


  end
  

end
