FactoryBot.define do
  factory :collection do
    user
    name { "Must Join Communities" }
    collection_items_attributes { [{ collectable: association(:community) }] }

    trait :unformatted do
      name { " Must Join Communities " }
    end
  end
end
