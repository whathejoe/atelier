class SessionsController < ApplicationController
	def new
	end

	def create
	  @user = User.find_by_email(params[:session][:email])
	  if @user && @user.authenticate(params[:session][:password]) && @user.is_admin?
	    session[:user_id] = @user.id
	    redirect_to '/admin'
	  else
	    redirect_to '/login'
	  end
	end

	def destroy 
	  session[:user_id] = nil 
	  redirect_to '/login' 
	end

	def add_to_cart

		if params[:qty] == "0" || params[:qty] == ""
			params[:qty] = 1
		end

		user_session.add_item(params[:id], params[:qty])

		flash[:message] = "Added to cart successfully!"
		redirect_to product_path(id: params[:id], quantity: params[:qty])
	end

	def checkout
		
	end

	#
	# 		remove
	#
	def checkout2
		
	end





end
