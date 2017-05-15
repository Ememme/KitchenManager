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
  test "should create product" do

    assert_difference('Product.count') do
      post products_url, params: { product: { product_name: 'Mozarella', quantity: '1', expiration_date: '2017-05-30', product_type: 'dairy' } }
    end

    assert_redirected_to product_path(Product.last)
  end

  #
  test "should show product" do
    first_show = FactoryGirl.create(:product)
    get product_url(first_show)
    assert_response :success
  end
  #
  test "should get edit" do
    first_edit_product = FactoryGirl.create(:product)
    get edit_product_url(first_edit_product)
    assert_response :success
  end

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