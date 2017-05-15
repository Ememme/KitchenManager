class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = 'Product was added.'
        redirect_to products_path
      else
        flash[:error] = 'Product cannot be saved'
        render :new
      end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
      if @product.update(product_params)
        redirect_to products_path, notice: 'Product was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product #{product.product_name} has been deleted.'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :quantity, :unit, :expiration_date, :product_type)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
