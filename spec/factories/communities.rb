FactoryBot.define do
  factory :community do
    sequence(:name) { |n| "programmer.humor#{n}" }
    description { "css is programming language" }

    trait :invalid do
      name { "" }
      description { "" }
    end

    trait :unformatted do
      name { " programmer.humor " }
      description { " css is programming language " }
    end
  end
end
