FactoryGirl.define do
  factory :product do
  product_name "Product"
  quantity 1
  expiration_date Date.today
  end
end
