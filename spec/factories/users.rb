FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "john.doe#{n}" }
    password { "12345678" }

    trait :admin do
      role { :admin }
    end

    trait :invalid do
      username { "" }
      password { "" }
    end

    trait :unformatted do
      username { " JOHN.DOE " }
    end
  end
end
