FactoryBot.define do
  factory :like do
    user
    association :likeable, factory: :post
  end
end
