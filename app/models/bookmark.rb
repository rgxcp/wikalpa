class Bookmark < ApplicationRecord
  belongs_to :bookmarkable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :user, uniqueness: { scope: [:bookmarkable_type, :bookmarkable_id] }
  validates :bookmarkable_type, inclusion: { in: ["Collection", "Comment", "Post", "Reply"] }
end
