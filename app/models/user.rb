class User < ActiveRecord::Base
	has_secure_password

	rails_admin do
		include_fields :password, :password_confirmation
		exclude_fields :password_digest
  	end
end
