class ProductsController < ApplicationController
  def index
  end

  def show
    render "products/#{params[:name]}"
  end

  def new
    @product = Product.new
    @product.images.build
  end
  def create
    @product = Product.new(product_parameter)
    respond_to do |format|
      if @product.save
          params[:images][:image].each do |image|
            @product.images.create(image: image, product_id: @product.id)
          end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def product_parameter
    params.require(:product).permit(:name, :price, :status, :delivery_price, :delivery_way, :scheduled, images_attributes: [:image]).merge(user_id: current_user.id)
  end

end