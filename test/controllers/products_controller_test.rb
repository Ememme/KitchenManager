require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test 'the truth' do
  #   assert true
  # end
  setup do
    @product = Product.new
  end

  test 'should get index' do
    get products_path
    assert_response :success
  end

  test 'should get new' do
    get new_product_path
    assert_response :success
  end
  #
  test 'should create product' do

    assert_difference('Product.count') do
      post products_url, params: { product: { product_name: 'Mozarella', quantity: '1', unit: 'piece', expiration_date: '2017-05-30', product_type: 'dairy' } }
    end

    assert_redirected_to products_path
  end

  #
  test 'should show product' do
    first_show = FactoryGirl.create(:product)
    get product_url(first_show)
    assert_response :success
  end
  #
  test 'should get edit' do
    first_edit_product = FactoryGirl.create(:product)
    get edit_product_url(first_edit_product)
    assert_response :success
  end

  test 'should update product' do
    first_patch = FactoryGirl.create(:product)
    pp first_patch
    patch product_path(first_patch), params: { product: { product_type: 'dairy', quantity: '10' } }

    follow_redirect!
    assert_equal 'dairy', first_patch.reload.product_type
    pp first_patch
  end

  test 'should destroy product' do
    first_destroy = FactoryGirl.create(:product)
    assert_difference('Product.count', -1) do
      delete product_url(first_destroy)
    end
    assert_redirected_to products_url
  end
end
