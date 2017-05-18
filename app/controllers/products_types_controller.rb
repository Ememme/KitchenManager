class ProductsTypesController < ApplicationController

  before_action :set_product_type, only: [:edit, :update, :destroy]

  def index
    @product_type = ProductsType.all
  end
  def show
  end

  def new
    @product_type = ProductsType.new
  end

  def create
    @product_type = ProductsType.new(product_type_params)
    if @product_type.save
      flash[:notice] = 'Product type created.'
      redirect_to products_types_path
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
      redirect_to products_types_path
    else
      render :edit
    end
  end


  def destroy
    @product_type.destroy
    flash[:notice] = "Product type has been deleted."
    redirect_to products_types_path
  end

  private
  def product_type_params
    params.require(:products_type).permit(:c, :unit)
  end

  def set_product_type
    @product_type = ProductsType.find(params[:id])
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
