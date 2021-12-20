FactoryBot.define do
  factory :like do
    user
    likeable { association :post }
  end
end
