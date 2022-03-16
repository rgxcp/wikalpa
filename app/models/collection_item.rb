class CollectionItem < ApplicationRecord
  belongs_to :collectable, polymorphic: true
  belongs_to :collection

  validates :collection, presence: true
  validates :collectable_type, inclusion: { in: ["Comment", "Community", "Post", "Reply", "User"] }
  validates :collectable_id, uniqueness: { scope: :collection_id }
end
