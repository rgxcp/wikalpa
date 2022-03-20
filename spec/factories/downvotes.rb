FactoryBot.define do
  factory :downvote do
    user
    downvoteable { association :post }
  end
end
