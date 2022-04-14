class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  has_many :bookmarks, as: :bookmarkable
  has_many :collection_items, as: :collectable
  has_many :collections, through: :collection_items
  has_many :downvotes, as: :downvoteable
  has_many :upvotes, as: :upvoteable

  validates :comment, presence: true
  validates :user, presence: true
  validates :body, length: { maximum: 255 }
  validates :body, presence: true
  validates :is_spoiler, inclusion: { in: [true, false] }

  before_validation do
    self.body = body.strip if body.present?
  end
end
