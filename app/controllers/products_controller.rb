class ProductsController < ApplicationController
  # after_update :low_stock_info #to do
  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_storage

  def index
    @products = current_user.products.all
  end

  def new
    @types = ProductType.all.map{|type| [type.product_type, type.unit] }
    @storage = current_user.storages.find(params[:storage_id])
    @product = @storage.products.new
  end

  def create
    @types = ProductType.all.map{|type| [type.product_type, type.unit] }
    @storage = current_user.storages.find(params[:storage_id])
    @product = @storage.products.new(product_params)
      if @product.save
        flash[:notice] = 'Product was added.'
        redirect_to storage_products_path(storage)
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
  end

  def update
    if @product.update(product_params)
      redirect_to storage_products_path(storage), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product #{@product.product_name} has been deleted."
    redirect_to storage_product_path(storage, product)
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

  def low_stock_info
    if @product.quantity.zero?
      shopping_list = []
      shopping_list << @product
    else
      notification_list = []
      notification_list << @product.product_name
    end
  end
end
