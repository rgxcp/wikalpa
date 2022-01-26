FactoryBot.define do
  factory :collection do
    user
    name { "Must Join Communities" }

    trait :unformatted do
      name { " Must Join Communities " }
    end
  end
end
