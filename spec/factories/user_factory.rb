FactoryGirl.define do

  sequence(:email) { |n| "user_#{n}@example.com" }

  factory :user do
    email
    password '1234567890'
  end

  factory :admin, class: User do
    email
    password '1234567890'
    admin true
    first_name "Peter"
    last_name "Example"
  end
