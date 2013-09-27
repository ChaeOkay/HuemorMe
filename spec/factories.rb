FactoryGirl.define do

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "test@test.com" #Faker::Internet.email
    password "password"
    password_confirmation "password"
  end

  factory :lamp do
    on false
  end

  factory :bridge do
    user_id { 1 }
    ip { "192.168.0.152" }
  end

end
