class ProductTypesController < ApplicationController

  before_action :set_product_type, only: [:edit, :update, :destroy]

  def index
    @product_type = ProductType.all
  end

  def show
  end

  def new
    @product_type = ProductType.new

  end

  def create
    @product_type = ProductType.new(product_type_params)
    if @product_type.save
      flash[:notice] = 'Product type created.'
      # session[:return_to] = request.referer
      redirect_to product_types_path
      # czy redirect_to :back?????
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_type.update(product_type_params)
      flash[:notice] = 'Product type updated.'
      redirect_to product_types_path
    else
      render :edit
    end
  end


  def destroy
    if @product.product_type.empty?
      @product_type.destroy
      flash[:notice] = "Product type has been deleted."
      redirect_to product_types_path
    else
      flash[:notice] = "Product type assigned to product cannot be deleted"
      redirect_to product_types_path
    end
  end

  private
  def product_type_params
    params.require(:product_type).permit(:product_type, :unit)
  end

  def set_product_type
    @product_type = ProductType.find(params[:id])
    # @product_type = ProductsType.find(params[:product_type_id])
  end

  def manage_products
    # id = params[:product_type_id]
    # @product_type = ProductType.find(id)
    #
    # if params[:include_deleted]
    #   @products = @product_type.products.sorted
    # else
    #   @products = @product_type.products.notdeleted.sorted
    # end
  end
end
