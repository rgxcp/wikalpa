FactoryBot.define do
  factory :reply do
    comment
    user
    body { "just setting up my wklp" }

    trait :spoiler do
      is_spoiler { true }
    end

    trait :invalid do
      body { "" }
    end

    trait :unformatted do
      body { " just setting up my wklp " }
    end
  end
end
