FactoryBot.define do
  factory :comment do
    post
    user
    body { "just setting up my wklp" }
  end
end
