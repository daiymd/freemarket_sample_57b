class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show]
  def index
    @products = []
    @products1 = Product.all.includes(:images).order("created_at DESC")
    @products1.each do |product|
      if product.transactions[0].buyer_id == nil
        @products << product
      end
    end
      
  end

  def show
    @seller = User.find(@product.transactions[0]["seller_id"])
    @transaction = Transaction.find_by(product_id: @product.id)
    @category = Category.find(@product.category_id)
    @image = @product.images[0]
    @products = Product.all.includes(:images).order("created_at DESC")
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
          @transaction = Transaction.new(product_id: @product.id, seller_id: current_user.id)
          @transaction.save
        format.html{redirect_to products_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
    @category_parent_array = ["--"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name    
    end
    @product.images[0].image.cache! unless  @product.images[0].image.blank?
  end

  def update
    @category = Category.find_by(name: params[:category])
    if @product.update(product_params2)
      @product.category_id = @category.id
      if params[:images][:image]
      params[:images][:image].each do |image|
        @product.images.update(image: image, product_id: @product.id)
      end
    else
      params[:images][:default].each do |image|
        @product.images.update(image: image, product_id: @product.id)
    end
  end
      redirect_to product_path(@product[:id])
    else
      render :edit
  end
end

  def destroy
    transaction = Transaction.find(params[:id])
    if user_signed_in? && transaction.seller_id == current_user.id
      @product.delete
    end
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :prefecture, :price, :status, :delivery_price, :delivery_way, :scheduled, images_attributes:  [:image])
  end

  def product_params2
    params.require(:product).permit(:name, :text, :prefecture, :price, :status, :delivery_price, :delivery_way, :scheduled, :image_cache)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end