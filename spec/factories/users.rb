FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "john.doe#{n}" }
    password { "12345678" }

    trait :unformatted do
      username { " JOHN.DOE " }
    end
  end
end
