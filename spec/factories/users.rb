require 'ffaker'

FactoryGirl.define do

  factory :user do
    name FFaker::Name.name
    email 'test@tests'
    password "122333"
    password_confirmation '122333'
  end
end
