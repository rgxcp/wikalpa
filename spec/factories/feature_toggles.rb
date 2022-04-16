FactoryBot.define do
  factory :feature_toggle do
    user
    sequence(:name) { |n| "ALLOW_USERS_TO_DELETE_ACCOUNT#{n}" }

    trait :unformatted do
      name { " ALLOW_USERS_TO_DELETE_ACCOUNT " }
    end
  end
end
