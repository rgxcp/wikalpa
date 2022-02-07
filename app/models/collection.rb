class Collection < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, as: :bookmarkable
  has_many :collection_items
  has_many :likes, as: :likeable
  has_many :visitors, as: :visitable

  accepts_nested_attributes_for :collection_items

  validates :user, presence: true
  validates :name, length: { in: 5..50 }
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :collection_items, presence: true, on: :create

  before_validation do
    self.name = name.strip if name.present?
  end
end
