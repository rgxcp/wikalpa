FactoryBot.define do
  factory :buddy do
    user
    buddy { association :user }
  end
end
