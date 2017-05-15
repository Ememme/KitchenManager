FactoryGirl.define do
  factory :product do
  # product_name "Product"
  sequence(:product_name) { |n| "product#{n}" }
  quantity 1
  expiration_date Date.today
  product_type 'vegetable'
  unit 'piece'
  end
end
