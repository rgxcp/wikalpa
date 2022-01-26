FactoryBot.define do
  factory :visitor do
    user
    visitable { association :community }
  end
end
