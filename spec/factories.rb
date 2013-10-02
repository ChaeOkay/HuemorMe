FactoryGirl.define do

  factory :user do
    id 1
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "TeSt@teSt.cOm"
    password "password123"
    password_confirmation "password123"
    username "username_test"
  end

  trait :with_bridge do
    after :create do |user|
      FactoryGirl.create_list :bridge, 1, :user => user
    end
  end

  factory :lamp do
    light_identifier "1"
    bridge
    on false
    color "blue"
    effect "colorloop"
    brightness "30"
  end

  factory :bridge do
    user
    ip "000.000.0.000"
    id "0000000000000000"
  end

  trait :with_lamps do
    after :create do |bridge|
      FactoryGirl.create_list :lamp, 1, :bridge => bridge
    end
  end
end
