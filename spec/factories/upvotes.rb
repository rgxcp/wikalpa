FactoryBot.define do
  factory :upvote do
    user
    upvoteable { association :post }
  end
end
