FactoryGirl.define do

  factory :user do
    id 1
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "test@test.com"
    password "password"
    password_confirmation "password"
    username "username_test"
  end

  trait :with_bridges do
    after :create do |user|
      FactoryGirl.create_list :bridge, 1, :user => user
    end
  end

  factory :lamp do
    bridge
    name "kitchen"
    on false
    hue_number "1"
  end

  factory :bridge do
    user
    ip "000.000.0.000"
    id "0000000000000000"
  end

  trait :with_lamps do
    after :create do |bridge|
      FactoryGirl.create_list :lamp, 3, :bridge => bridge
    end
  end

end
