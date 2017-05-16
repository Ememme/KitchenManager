FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test@testowy.pl#{n}" }
    password '12345678'
  end
end
