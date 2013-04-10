# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyString"
    price "9.99"
    sale_price "9.99"
    code "MyString"
    image "MyString"
    category nil
  end
end
