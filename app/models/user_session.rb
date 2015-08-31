class UserSession
	def initialize(session)
		@session = session
		@session[:cart] ||= {}
		@session[:cart][:products] ||= {}
	end

	def add_item(id)
		@session[:cart][:products][id] ||= {}
		@session[:cart][:products][id][:id] ||= id
		@session[:cart][:products][id][:quantity] ||= id
	end

	def show_items
		@cart = @session[:cart]
	end

end