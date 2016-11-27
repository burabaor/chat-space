# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name FFaker::Company.name
  end
  factory :message do
    body FFaker::Tweet.body
  end
  factory :empty_message do
    body ""
  end
end
