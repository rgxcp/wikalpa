FactoryBot.define do
  factory :post do
    community
    user
    body { "just setting up my wklp" }

    trait :unformatted do
      body { " just setting up my wklp " }
    end
  end
end
