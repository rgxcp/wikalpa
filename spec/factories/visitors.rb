FactoryBot.define do
  factory :visitor do
    user
    visitable { association :post }
  end
end
