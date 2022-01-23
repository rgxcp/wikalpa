class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :bookmarkable, polymorphic: true

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:bookmarkable_type, :bookmarkable_id] }
end
