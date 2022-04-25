FactoryBot.define do
  factory :username_history do
    user
    username { "the_cooler.john_doe" }
  end
end
