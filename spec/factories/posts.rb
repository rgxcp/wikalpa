FactoryBot.define do
  factory :post do
    community
    user
    body { "just setting up my wklp" }
  end
end
