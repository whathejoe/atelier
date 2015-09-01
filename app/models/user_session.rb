
class UserSession
	def initialize(session)
		@session = session
		@session["cart"] ||= {}
		@session["cart"]["products"] ||= {}
		@cart = @session["cart"]["products"]
	end

	def add_item(id, quantity)
		@cart[id] ||= {}
		@cart[id]["id"] ||= id
		@cart[id]["quantity"] = quantity
	end

	def show_items
		
	end

end

