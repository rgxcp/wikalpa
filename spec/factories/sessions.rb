FactoryBot.define do
  factory :session do
    user
    sequence(:device) { |n| "Nokia 331#{n}" }
    ip { "127.0.0.1" }
  end
end
