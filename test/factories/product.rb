FactoryGirl.define do
  factory :product do
  product_name "Product"
  quantity 1
  expiration_date Date.today
  product_type 'vegetable'
  end
end
