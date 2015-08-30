class ProductsController < ApplicationController
  def home
  	@bestsellers = Product.all
  	@new_arrivals = Product.all
  end

  def store
  	@products = Product.all
  end

  def product
  	
  end

end
