class UserSession
	def initialize(session)
		@session = session
		@session[:cart] ||= {}
		
	end

	def add_item(id)
		@session[:cart][:products] ||= {}
		@session[:cart][:products][id] ||= {}
		@session[:cart][:products][id][:id] ||= id
		# @session[:cart][:products][id][:quantity] ||= quantity
	end

	def show_items
		@cart = @session["cart"]["products"]
	end
# http://rubyfiddle.com/riddles/2ebce/3
end