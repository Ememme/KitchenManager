class ProductsController < ApplicationController
  # after_update :low_stock_info #to do
  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_storage
  before_action :set_product_type, only: [:new, :create, :edit]

  def index
    @storage = current_user.storages.find(params[:storage_id])
    @products = @storage.products

    if params[:search]
      @product = @storage.products.search(params[:search]).order("created_at DESC")
    else
      @product = @storage.products.all.order("created_at DESC")
    end
    # @products_w_type = Product.select('id', 'product_name', 'quantity', 'expiration_date', 'product_type_id', 'product_type', 'unit').joins("LEFT JOIN Product_types ON Products.product_type_id=Product_types.product_id;")

  end

  def new
    session[:return_to] = request.referer
    # @types = ProductType.all.map{|type| [type.product_type, type.id] }
    # @storage = current_user.storages.find(params[:storage_id])
    @product = @storage.products.new
  end

  def create
    # @types = ProductType.all.map{|type| [type.product_type, type.id] }
    # @storage = current_user.storages.find(params[:storage_id])
    @product = @storage.products.new(product_params)
      if @product.save
        flash[:notice] = 'Product was added.'
        redirect_to storage_products_path(@storage)
      else
        flash[:error] = 'Product cannot be saved'
        render :new
      end
  end

  def show
    @product = current_user.products.find(params[:id])
    # @soon_expires = current_user.products.where(expiration_date)
  end

  def edit
    # @types = ProductType.all.map{|type| [type.product_type, type.id] }
  end

  def update
    if @product.update(product_params)
      redirect_to storage_products_path(@storage), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product #{@product.product_name} has been deleted."
    redirect_to storage_products_path(@storage)
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :quantity, :expiration_date, :product_type_id)
  end

  def set_product
    @product = current_user.products.find(params[:id])
  end

  def set_storage
    @storage = current_user.storages.find(params[:storage_id])
  end

  def set_product_type
    @types = ProductType.all.map{|type| [type.product_type, type.id] }
  end
end
