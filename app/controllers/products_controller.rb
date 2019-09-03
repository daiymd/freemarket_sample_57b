class ProductsController < ApplicationController
  def index
  end

  def show
    render "products/#{params[:name]}"
  end

  def new
    
  end
  
end
