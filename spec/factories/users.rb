FactoryBot.define do
  factory :user do
    username { "john.doe" }
    password { "12345678" }

    trait :unformatted do
      username { " john.doe " }
    end
  end
end
