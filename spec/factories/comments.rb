FactoryBot.define do
  factory :comment do
    post
    user
    body { "just setting up my wklp" }

    trait :invalid do
      body { "" }
    end

    trait :unformatted do
      body { " just setting up my wklp " }
    end
  end
end
