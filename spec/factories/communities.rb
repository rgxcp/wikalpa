FactoryBot.define do
  factory :community do
    name { "programmer.humor" }
    description { "css is programming language" }

    trait :unformatted do
      name { " programmer.humor " }
      description { " css is programming language " }
    end
  end
end
