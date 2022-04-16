FactoryBot.define do
  factory :feature_toggle do
    association :user, :admin
    sequence(:name) { |n| "ALLOW_USERS_TO_DELETE_ACCOUNT#{n}" }

    trait :unformatted do
      name { " allow_users_to_delete_account " }
    end
  end
end
