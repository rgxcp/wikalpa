FactoryBot.define do
  factory :collection_item do
    collection
    collectable { association :community }
  end
end
