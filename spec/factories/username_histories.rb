FactoryBot.define do
  factory :username_history do
    user
    username { "cooler.john.doe" }
  end
end
