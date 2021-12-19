FactoryBot.define do
  factory :comment do
    post
    user
    body { "just setting up my wklp" }

    trait :unformatted do
      body { " just setting up my wklp " }
    end
  end
end
