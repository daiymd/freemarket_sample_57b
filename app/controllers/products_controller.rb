class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  
  def index
  end

  def show
    render "products/#{params[:name]}"
  end

  def new
    @product = Product.new
    @product.images.build
    @category_parent_array = ["--"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    respond_to do |format|
      format.json 
    end
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
    respond_to do |format|
      format.json 
    end
  end

  def create
    @category = Category.find_by(name: params[:category])
    @product = Product.new(product_params) 
    @product.category_id = @category.id
    respond_to do |format|
      if @product.save 
        params[:images][:image].each do |image|
            @product.images.create(image: image, product_id: @product.id)
          end
          Transaction.create(product_id: @product.id, seller_id: current_user.id)
        format.html{redirect_to products_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :prefecture, :price, :status, :delivery_price, :delivery_way, :scheduled, images_attributes:  [:image])
  end

  def set_product
   @product = Product.find(params[:id])
  end

end
  