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
		redirect_to product_path(id: params[:id])
	end

	def checkout
		
	end

	def checkout2
		
	end

	def cart
		@items = session["cart"]["products"]
		@products = Product.all

		@subtotal = 0
		@items.each do |id, hash|
			@subtotal += @products.find_by_id(id).price * hash["quantity"].to_f
		end

		@shipping_fee = 6.99

		@grand_total = @subtotal + @shipping_fee # + some value ex. Shipping cost

	end

end
