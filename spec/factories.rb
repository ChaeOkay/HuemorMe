FactoryGirl.define do

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "test@test.com"
    password "password"
    password_confirmation "password"
  end

  factory :lamp do
    on false
  end

end
