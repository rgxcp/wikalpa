FactoryBot.define do
  factory :collection do
    user
    name { "Must join communities" }

    trait :unformatted do
      name { " Must join communities " }
    end
  end
end
