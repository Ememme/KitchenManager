require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @product = Product.new
  end

  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should get new" do
    get new_product_path
    assert_response :success
  end
  #
  # test "should create product" do
  #   assert_difference('Product.count') do
  #     post products_path, params: { product: { product_name: @product.product_name, quantity: @product.quantity, product_type: @product.product_type } }
  #   end
  #
  #   assert_redirected_to product_path(Product.last)
  # end
  #
  # test "should show product" do
  #   get product_url(@product)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_product_url(@product)
  #   assert_response :success
  # end
  #
  # test "should update product" do
  #   patch product_url(@product), params: { product: { email: @product.email, name: @product.name } }
  #   assert_redirected_to product_url(@product)
  # end
  #
  # test "should destroy product" do
  #   assert_difference('product.count', -1) do
  #     delete product_url(@product)
  #   end
  #
  #   assert_redirected_to products_url
  # end
end
