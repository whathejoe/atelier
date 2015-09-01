class ProductsController < ApplicationController
  def home
  	@bestsellers = Product.all
  	@new_arrivals = Product.all
  end

  def store
  	@products = Product.all
  end

  def product
  	@product = Product.find(params[:id])     
  end

end
