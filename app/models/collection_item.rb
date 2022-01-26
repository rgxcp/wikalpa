class CollectionItem < ApplicationRecord
  belongs_to :collection
  belongs_to :collectable, polymorphic: true

  validates :collection, presence: true
  validates :collectable_id, uniqueness: { scope: :collection_id }
end
