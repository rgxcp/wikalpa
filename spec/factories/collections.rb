FactoryBot.define do
  factory :collection do
    user
    name { "Must Join Communities" }
    collection_items_attributes { [{ collectable: association(:community) }] }

    trait :invalid do
      name { "" }
      collection_items_attributes { [] }
    end

    trait :unformatted do
      name { " Must Join Communities " }
    end
  end
end
