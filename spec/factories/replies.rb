FactoryBot.define do
  factory :reply do
    comment
    user
    body { "just setting up my wklp" }

    trait :unformatted do
      body { " just setting up my wklp " }
    end
  end
end
