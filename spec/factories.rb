FactoryGirl.define do

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "test@test.com"
    password "password"
    password_confirmation "password"
    username "username_test"
  end

  factory :lamp do
    name "kitchen"
    on false
    hue_number "1"
    bridge
  end

  factory :bridge do
    user
    ip "000.000.0.000"
  end

end
