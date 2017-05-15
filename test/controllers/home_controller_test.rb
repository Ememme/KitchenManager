require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'should get home index' do
    get root_path
    assert_response :success
  end
end
