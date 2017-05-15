require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # testy do product name

  def setup
    @product = Product.new
  end

  def error_messages
    @product.valid?
    @product.errors.full_messages
  end

  test 'should require product name' do
    error_messages
    # assert @product.errors.empty?
    assert_includes @product.errors[:product_name],"can't be blank"
  end
  # end

  test 'should ckeck if product name is a string' do
    first_product = FactoryGirl.create(:product, product_name: 'test Product name')
    assert_instance_of String, 'test Product name'
  end

  # test 'should check if product name is min. 3 characters' do
  #   second_product = FactoryGirl.create(:product, product_name: 'kot')
  #   assert_includes error_messages,["Product name can't be blank", "Product name is too short (minimum is 3 characters)"]
  #   @product.product_name = "a" * 5
  #   @product.valid?
  #   assert_includes @product.errors[:product_name], ["Product name can't be blank", "Product name is too short (minimum is 3 characters)"]
  # end

  # testy na pole quantity
  test 'should check if quantity is integer' do
    @product.quantity = 2
    assert_instance_of Integer, 2
    # assert_includes error_messages, "Price is not a number"
  end

  test 'quantity can be a float' do
    @product.quantity = 10.5
    @product.valid?
    assert @product.errors[:quantity].empty?
  end

  # testy na pole data
  test 'should check if date is a date' do
    @product.expiration_date = Date.today
    assert_instance_of Date, Date.today
  end


  test 'date cannot be in the past' do
    @product.expiration_date = 1.month.ago
    @product.valid?
    assert_equal @product.errors[:expiration_date], ["can't be in the past"]
  end

  # testy na pole product_type
  test 'should require product type' do
    error_messages
    # assert @product.errors.empty?
    assert_includes @product.errors[:product_type],"can't be blank"
  end

  test 'should ckeck if product type is a string' do
    third_product = FactoryGirl.create(:product, product_type: 'Vegetable')
    assert_instance_of String, 'Vegetable'
  end

  # test na pole unit
  test 'should require unit' do
    error_messages
    # assert @product.errors.empty?
    assert_includes @product.errors[:unit],"can't be blank"
  end

  test 'should check if unit is a string' do
    first_unit = FactoryGirl.create(:product, unit: 'test unit')
    assert_instance_of String, "test unit"
  end

end
