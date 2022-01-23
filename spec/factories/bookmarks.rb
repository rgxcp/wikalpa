FactoryBot.define do
  factory :bookmark do
    user
    bookmarkable { association :post }
  end
end
