require 'ffaker'

FactoryGirl.define do
  factory :user do
    var_password = FFaker::Internet.password
    # define user
    name FFaker::Name.name
    email FFaker::Internet.email
    password var_password
    password_confirmation var_password
  end
end
