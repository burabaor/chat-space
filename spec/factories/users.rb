FactoryGirl.define do

  factory :user do
    name 'hoge'
    email 'test@tests'
    password "122333"
    password_confirmation '122333'
  end
end
