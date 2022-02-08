class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :bookmarks, as: :bookmarkable
  has_many :collection_items, as: :collectable
  has_many :likes, as: :likeable
  has_many :replies
  has_many :collections, through: :collection_items

  validates :post, presence: true
  validates :user, presence: true
  validates :body, length: { maximum: 255 }
  validates :body, presence: true

  before_validation do
    self.body = body.strip if body.present?
  end
end
