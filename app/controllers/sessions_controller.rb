class SessionsController < ApplicationController
	def new
	end

	def current_user
    	@_current_user ||= session[:current_user_id] &&
      	User.find_by(id: session[:current_user_id])
  	end

	def create
	  @user = User.find_by_email(params[:session][:email])
	  if @user && @user.authenticate(params[:session][:password]) && @user.is_admin?
	    session[:user_id] = @user.id
	    redirect_to '/admin'
	  else
	    redirect_to 'login'
	  end
	end

	def destroy 
	  session[:user_id] = nil 
	  redirect_to '/login' 

	  reset_session
	end

	def add_to_cart
		user_session.add_item(params[:id])

		flash[:message] = "Added to cart successfully!"
		redirect_to product_path(params[:id])
	end

	def checkout
		
	end


end
