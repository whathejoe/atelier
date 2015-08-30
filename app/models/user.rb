class User < ActiveRecord::Base
	has_secure_password

	rails_admin do
		field :email
		field :password
		field :password_confirmation
		
  	end
end
